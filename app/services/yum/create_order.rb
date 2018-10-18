# frozen_string_literal: true

module Yum
  class CreateOrder
    attr_reader :ordered_for, :ordered_by, :name, :quantity, :shopping_list

    def initialize(ordered_for: nil, ordered_by: nil, name: nil, quantity: 1, shopping_list: nil)
      @ordered_for = ordered_for
      @ordered_by = ordered_by
      @name = name
      @quantity = quantity
      @shopping_list = get_shopping_list(shopping_list)
    end

    def call
      order = @shopping_list.items.create(name: @name,
                                          quantity: @quantity,
                                          ordered_by: @ordered_by,
                                          ordered_for: @ordered_for,
                                          category_id: 25) # Hardcoding the 'Misc' category ID for the moment

      message = order ? message_for(order) : 'Something went wrong. Throw something soft at Eddie'

      { text: message }
    end

    private

    def get_shopping_list(name)
      list = if name
               ShoppingList.find_by(name: name.downcase)
             else
               ShoppingList.primary
             end

      list.presence || ShoppingList.first
    end

    def message_for(order)
      if order.ordered_by == order.ordered_for
        "#{order.ordered_by}, you have ordered #{order.quantity} #{order.name} in #{@shopping_list.name}"
      else
        "You have ordered #{order.quantity} #{order.name} for #{order.ordered_for} in #{@shopping_list.name}"
      end
    end
  end
end

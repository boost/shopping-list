module Yum
  class CreateOrder
    attr_reader :user, :creator, :name, :shopping_list

    def initialize(user: nil, creator: nil, name: nil, shopping_list: nil)
      @user = user
      @creator = creator
      @name = name
      @shopping_list = get_shopping_list(shopping_list)
    end

    def call
      order = @shopping_list.items.create(name: @name,
                                          ordered_by: @creator,
                                          ordered_for: @user,
                                          category_id: 25) # Hardcoding the 'Misc' category ID for the moment

      message = order ? message_for(order) : 'Something went wrong. Throw something soft at Eddie'

      { text: message }
    end

    private

    def get_shopping_list(name)
      list = if name
               ShoppingList.where(name: name.downcase)
             else
               ShoppingList.where(primary: true)
             end

      (list.presence || ShoppingList.where(name: 'default list')).first
    end

    def message_for(order)
      if order.ordered_by == order.ordered_for
        "#{order.ordered_by}, you have ordered #{order.name} in #{@shopping_list.name}"
      else
        "You have ordered #{order.name} for #{order.ordered_for} in #{@shopping_list.name}"
      end
    end
  end
end

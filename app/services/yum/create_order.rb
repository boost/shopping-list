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
                                          category_id: Category.last.id)

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
        "You must be hungry #{order.ordered_by}, you have ordered yummy #{order.name}"
      else
        "You have ordered yummy #{order.name} for #{order.ordered_for}"
      end
    end
  end
end

module Yum
  class CreateOrder
    attr_reader :user, :creator, :item

    def initialize(user: nil, creator: nil, item: nil)
      @user = user
      @creator = creator
      @item = item
    end

    def call
      Order.where(user: @user).delete_all
      order = Order.create(user: @user, creator: @creator, item: @item)
      message = order ? message_for(order) : 'Something went wrong. Throw something soft at Eddie'

      { text: message }
    end

    private

      def message_for(order)
        if order.user == order.creator
          "You must be hungry #{order.creator}, you have ordered yummy #{order.item}"
        else
          "You have ordered yummy #{item} for #{order.user}"
        end
      end
  end
end

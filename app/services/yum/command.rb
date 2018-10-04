module Yum
  class Command
    attr_reader :command, :user, :text

    def initialize(command, user, text)
      @command = command
      @user = user
      @text = text
    end

    def call
      return _? if @command == '?'

      send(@command.to_sym)
    end

    # command executing methods
    private

      def _?
        order = Order.where(user: @user).last

        message = if order
                    "#{order.who} ordered #{order.item} at #{order.created_at.strftime('%d %h %H:%M')} for you"
                  else
                    'Your dont have any orders yet'
                  end

        { text: message }
      end

      def orders
        orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(:item)

        if orders.empty?
          { text: 'There are no orders for today' }
        else
          { text: "Orders for #{orders.first.created_at.strftime('%d %h')}. slack-yum.herokuapp.com",
            attachments: orders.map { |order| { text: "#{order.user}: #{order.item}" } } }
        end
      end

      def help
        { text: "/yum <any text>. will make an order for you.\n /yum <command>",
          attachments: COMMANDS.map { |command, desc| { text: "#{command} - #{desc}" } } }
      end
  end
end

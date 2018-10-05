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
      order = Item.where(ordered_for: @user).last

      message = if order
                  "#{order.ordered_by} ordered #{order.name} at #{order.created_at.strftime('%d %h %H:%M')} for #{order.ordered_for}"
                else
                  'Your dont have any orders yet'
                end

      { text: message }
    end

    def orders
      primary_list = ShoppingList.primary

      if primary_list.items.empty?
        { text: "There are no orders for today in #{primary_list.name}" }
      else
        { text: "Orders in #{primary_list.name}. slack-yum.herokuapp.com",
          attachments: primary_list.items.map { |item| { text: "#{item.ordered_for}: #{item.name}" } } }
      end
    end

    def help
      { text: "/yum <any text>. will make an order for you.\n /yum <command>",
        attachments: COMMANDS.map { |command, desc| { text: "#{command} - #{desc}" } } }
    end
  end
end

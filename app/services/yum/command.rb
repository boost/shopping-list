# frozen_string_literal: true

module Yum
  class Command
    attr_reader :command, :user, :text, :shopping_list

    def initialize(command, user, text, shopping_list = nil)
      @command = command
      @user = user
      @text = text
      @shopping_list = shopping_list ? ShoppingList.find_by(name: shopping_list.downcase) : ShoppingList.primary
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

    def shopping_lists
      shopping_lists = ShoppingList.all

      if shopping_lists.empty?
        { text: 'There are no shopping lists created. Scarmble and create some' }
      else
        { text: 'Available shopping lists',
          attachments: shopping_lists.map { |list| { text: "#{list.hash_tag}#{' (default)' if list.primary}" } } }
      end
    end

    def orders
      if @shopping_list.items.empty?
        { text: "There are no orders in #{@shopping_list.name}" }
      else
        { text: "Orders in #{@shopping_list.name}. shopping.cloud.boost.co.nz/shopping_lists/#{@shopping_list.id}",
          attachments: @shopping_list.items.map { |item| { text: "#{item.ordered_for}: #{item.name}" } } }
      end
    end

    def delete
      item = @shopping_list.items.where(ordered_by: @user).last

      if item
        item.destroy

        { text: "#{item.name} has been deleted from #{@shopping_list.name}" }
      else

        { text: "There are no orders in #{@shopping_list.name} to delete" }
      end
    end

    def help
      extra_helpers = [{ text: '/yum @<username> <order name>. will let you make an order for another person. Dont type in the arrows pls :D' },
                       { text: '/yum #<shopping list name> <order name>. will make an order for you in that shopping list' }]

      { text: "/yum <any text>. will make an order for you in the default shopping list.\n /yum <command>",
        attachments: COMMANDS.map { |command, desc| { text: "#{command} - #{desc}" } } + extra_helpers }
    end
  end
end

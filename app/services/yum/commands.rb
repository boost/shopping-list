# frozen_string_literal: true

module Yum
  COMMANDS = { orders: 'Will lists all the orders in default shopping list for today',
               shopping_lists: 'Will lists all the shopping list names',
               delete: 'Deletes the last order you have created',
               flush: 'Deletes all orders from a shopping list',
               '?': 'Will respond with your last order',
               help: 'Returns all commands available for yum' }.freeze
end

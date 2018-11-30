# frozen_string_literal: true

module Yum
  COMMANDS = { orders: 'Will lists all the orders for the given shopping list',
               shopping_lists: 'Will lists all the shopping list names',
               delete: 'Deletes the last order you have created',
               flush: 'Deletes all orders from a shopping list',
               welcome: 'Returns the current settings',
               welcomeMessage: 'Sets the welcome message',
               welcomeClient: 'Sets the client name for welcome message',
               welcomeColour: 'Sets the background colour for welcome message',
               welcomeTheme: 'Sets the theme of the template',
               '?': 'Will respond with your last order',
               help: 'Returns all commands available for yum' }.freeze
end

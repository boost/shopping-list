# frozen_string_literal: true

module Yum
  class Yummify
    attr_reader :user, :text, :slack_response

    def initialize(params)
      # String keys as this is called a active job
      @user = params['user_name']
      @text = TextParser.new(params['text'])
      @slack_response = SlackResponse.new(params['response_url'])
    end

    def call
      response = execute_action

      @slack_response.call(response) unless Rails.env.development?
    end

    private

    def execute_action
      return Command.new(@text.command, @user, @text.text).call if @text.command

      attributes = { ordered_for: @text.user || @user,
                     ordered_by: @user,
                     name: @text.text,
                     quantity: @text.quantity,
                     shopping_list: @text.shopping_list }

      CreateOrder.new(attributes).call
    end
  end
end

# frozen_string_literal: true

module Yum
  class Yummify
    attr_reader :user, :text, :slack_response

    def initialize(params)
      @user = params[:user_name]
      @text = TextParser.new(params[:text])
      @slack_response = SlackResponse.new(params[:response_url])
    end

    def call
      response = execute_action

      @slack_response.call(response)
    end

    private

    def execute_action
      return Command.new(@text.command, @user, @text.text).call if @text.command?

      attributes = { ordered_for: ordered_for_attribute,
                     ordered_by: @user,
                     name: name_attribute,
                     shopping_list: shopping_list_attribute }

      CreateOrder.new(attributes).call
    end

    def shopping_list_attribute
      return @text.shopping_list if @text.shopping_list?
    end

    def ordered_for_attribute
      @text.has_user? ? @text.user : @user
    end

    def name_attribute
      return @text.non_first_words if @text.has_user? || @text.shopping_list?

      @text.text
    end
  end
end

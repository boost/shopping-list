module Yum
  class Yummify
    attr_reader :user, :text, :slack_response

    def initialize(params)
      @user = params[:user_name]
      @text = params[:text]
      @slack_response = SlackResponse.new(params[:response_url])
    end

    def call
      parsed = TextParser.new(@text)

      response = execute_command(parsed)

      @slack_response.call(response)
    end

    private

    def execute_command(parsed)
      return Command.new(parsed.command, @user, @text).call if parsed.command?

      attributes = { ordered_for: @user, ordered_by: @user, name: @text }

      if parsed.has_user?
        attributes[:name] = parsed.non_first_words
        attributes[:ordered_for] = parsed.user
      end

      if parsed.shopping_list?
        attributes[:shopping_list] = parsed.shopping_list
        attributes[:name] = parsed.non_first_words
      end

      CreateOrder.new(attributes).call
    end
  end
end

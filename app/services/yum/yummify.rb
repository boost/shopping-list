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

      return CreateOrder.new(user: parsed.user,
                             creator: @user,
                             name: parsed.non_first_words).call if parsed.has_user?

      return CreateOrder.new(user: @user,
                             creator: @user,
                             name: parsed.non_first_words,
                             shopping_list: parsed.shopping_list).call if parsed.shopping_list?

      return CreateOrder.new(user: @user, creator: @user, name: @text).call
    end
  end
end

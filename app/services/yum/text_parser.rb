# frozen_string_literal: true

module Yum
  class TextParser
    attr_reader :text, :command, :user, :shopping_list, :quantity

    def initialize(text)
      @text = text
      @quantity = 1

      parse
    end

    def parse
      fetch_user
      fetch_command
      fetch_quantity
      fetch_shopping_list
    end

    private

    def fetch_user
      matches = @text.scan(/@[a-zA-z.0-9]*/)
      return if matches.empty?

      username = matches.first
      @text.gsub!(username, '').strip!
      @user = username.delete('@')
    end

    def fetch_command
      return unless COMMANDS.key? first_word.to_sym

      @command = first_word
      @text.gsub!(@command, '').strip!
    end

    def first_word
      @text.split(' ').first.strip
    end

    def fetch_quantity
      number = @text.last.to_i

      if number.positive?
        @quantity = number
        @text.delete!(@quantity.to_s).strip!
      else
        @quantity = 1
      end
    end

    def fetch_shopping_list
      matches = @text.scan(/#[a-zA-z.0-9]*/)
      return if matches.empty?

      shopping_list_name = matches.first
      @shopping_list = shopping_list_name.delete('#').tr('_', ' ')
      @text.gsub!(shopping_list_name, '').strip!
    end
  end
end

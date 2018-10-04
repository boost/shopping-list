module Yum
  class TextParser
    attr_reader :text, :command, :user

    def initialize(text)
      @text = text
    end

    def first_word
      @text.split(' ').first.strip
    end

    def non_first_words
      @text.gsub(first_word, '').strip
    end

    def command?
      return unless COMMANDS.keys.include? first_word.to_sym

      @command = first_word
      true
    end

    def has_user?
      matches = first_word.scan(/^@[a-zA-z.0-9]*/)
      return if matches.empty?

      @user = matches.first.gsub('@', '')
      true
    end
  end
end
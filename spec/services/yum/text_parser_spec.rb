require 'rails_helper'

RSpec.describe Yum::TextParser, type: :service do
  context 'when the text is a simple' do
    let(:subject) { Yum::TextParser.new('bat food') }

    it 'has full input as the text' do
      expect(subject.text).to eq 'bat food'
    end

    it 'has no shopping list' do
      expect(subject.shopping_list).to be nil
    end

    it 'has no user' do
      expect(subject.user).to be nil
    end

    it 'has no command' do
      expect(subject.command).to be nil
    end
  end

  context 'when the text has a user' do
    let(:subject) { Yum::TextParser.new('@batman bat food') }

    it 'have an order text' do
      expect(subject.text).to eq 'bat food'
    end

    it 'has no shopping list' do
      expect(subject.shopping_list).to be nil
    end

    it 'have a user' do
      expect(subject.user).to eq 'batman'
    end

    it 'has no command' do
      expect(subject.command).to be nil
    end
  end

  context 'when the text has a command' do
    let(:subject) { Yum::TextParser.new('?') }

    it 'have a command' do
      expect(subject.command).to eq '?'
    end
  end

  context 'when the text has everything' do
    let(:subject) { Yum::TextParser.new('#petfood @batman bat food') }

    it 'have order text' do
      expect(subject.text).to eq 'bat food'
    end

    it 'have a shopping list' do
      expect(subject.shopping_list).to eq 'petfood'
    end

    it 'have a user' do
      expect(subject.user).to eq 'batman'
    end
  end
end

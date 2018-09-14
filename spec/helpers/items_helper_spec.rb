require 'rails_helper'

describe ItemsHelper, type: :helper do
  describe '#format_list_name' do
    let(:name) { "Katherine's awesome list" }
    let(:created_at) { 'List created at' }

    context 'when the list has a name' do
      let(:named_list) { List.create(name: name) }

      it 'delivers the list name' do
        expect(helper.format_list_name(named_list)).to eq(name)
      end
    end

    context 'when the list name is nil' do
      let(:unnamed_list) { List.create }

      it 'delivers a string saying the time the list was created' do
        expect(helper.format_list_name(unnamed_list)).to include(created_at)
        expect(helper.format_list_name(unnamed_list)).to_not eq(name)
      end
    end

    context 'when the list name is an empty string' do
      let(:unnamed_list) { List.create(name: '') }

      it 'delivers a string saying the time the list was created' do
        expect(helper.format_list_name(unnamed_list)).to include(created_at)
        expect(helper.format_list_name(unnamed_list)).to_not eq(name)
      end
    end
  end
end

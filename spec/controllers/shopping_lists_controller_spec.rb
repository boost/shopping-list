require 'rails_helper'

RSpec.describe ShoppingListsController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index

      expect(response).to be_successful
    end

    it 'returns a 200 OK response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#destroy' do
    before do
      @shopping_list = ShoppingList.create(name: 'My list')
    end

    it 'deletes the list' do
      expect do
        delete :destroy, params: { id: @shopping_list.id }
      end.to change(ShoppingList, :count).by(-1)
    end
  end
end

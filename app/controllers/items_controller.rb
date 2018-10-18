# frozen_string_literal: true

class ItemsController < ApplicationController
  def create
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @item = @shopping_list.items.create(item_params)

    flash[:item_notice] = @item.errors.full_messages if @item.errors.count.positive?

    redirect_to shopping_list_path(@shopping_list)
  end

  def destroy
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @item = @shopping_list.items.find(params[:id])
    @item.destroy

    redirect_to shopping_list_path(@shopping_list)
  end

  def toggle_checked
    @item = Item.find(params[:item_id])
    @item.checked = !@item.checked
    @item.save

    redirect_to shopping_list_path(@item.shopping_list_id)
  end

  def decrement_quantity
    @item = Item.find(params[:item_id])

    if @item.quantity <= 1
      @item.destroy
    else
      @item.quantity -= 1
      @item.save
    end

    redirect_to shopping_list_path(@item.shopping_list_id)
  end

  def increment_quantity
    @item = Item.find(params[:item_id])
    @item.quantity += 1
    @item.save

    redirect_to shopping_list_path(@item.shopping_list_id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :category_id)
  end
end

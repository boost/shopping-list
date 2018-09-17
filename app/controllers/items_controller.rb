class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(item_params)

    flash[:item_notice] = @item.errors.full_messages if @item.errors.count > 0

    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.destroy

    redirect_to list_path(@list)
  end

  def toggle_checked
    @item = Item.find(params[:item_id])
    @item.checked = !@item.checked
    @item.save

    redirect_to list_path(@item.list_id)
  end

  def decrement_quantity
    @item = Item.find(params[:item_id])

    if @item.quantity <= 1
      @item.destroy
    else
      @item.quantity -= 1
      @item.save
    end

    redirect_to list_path(@item.list_id)
  end

  def increment_quantity
    @item = Item.find(params[:item_id])
    @item.quantity += 1
    @item.save

    redirect_to list_path(@item.list_id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :category_id)
  end
end

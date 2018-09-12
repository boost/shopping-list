class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(comment_params)

    flash[:notice] = @item.errors.full_messages if @item.errors.count > 0

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

  private

  def comment_params
    params.require(:item).permit(:name, :quantity)
  end
end

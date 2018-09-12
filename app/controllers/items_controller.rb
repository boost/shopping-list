class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(comment_params)

    flash[:notice] = @item.errors.full_messages if @item.errors.count > 0

    redirect_to list_path(@list)
  end

  def update
    @item = Item.find(params[:id])
    toggle_state(@item)

    redirect_to list_path(@item.list_id) # TODO: is there a shorthand?
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.destroy
    redirect_to list_path(@list)
  end

  private

  def toggle_state(item)
    item.checked = !item.checked
    item.save
  end

  def comment_params
    params.require(:item).permit(:name, :quantity)
  end
end

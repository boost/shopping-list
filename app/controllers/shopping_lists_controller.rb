class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @categories = Category.all
  end

  def new
    redirect_to shopping_lists_path
  end

  def edit
    @shopping_list = ShoppingList.find(params[:id])

    redirect_to @shopping_list
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)

    if @shopping_list.save
      redirect_to @shopping_list
    else
      flash[:notice] = @shopping_list.errors.full_messages if @shopping_list.errors.count > 0

      redirect_to shopping_lists_path
    end
  end

  def update
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.update(shopping_list_params)
    @shopping_list.save

    flash[:list_notice] = @shopping_list.errors.full_messages if @shopping_list.errors.count > 0
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.destroy

    redirect_to shopping_lists_path
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:name)
  end
end
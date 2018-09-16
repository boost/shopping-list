class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @categories = Category.all
  end

  def new
    redirect_to lists_path
  end

  def edit
    @list = List.find(params[:id])
    redirect_to @list
  end

  def create
    @list = List.new(list_params)

    @list.save
    redirect_to @list
  end

  def update
    @list = List.find(params[:id])
    @list.name = list_params[:name]
    @list.save

    redirect_to @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  private

  def list_params
    # TODO: account for empty string here? If string is empty, set field to nil?
    params.require(:list).permit(:name)
  end
end

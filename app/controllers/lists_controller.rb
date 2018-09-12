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
    @list = List.new

    @list.save
    redirect_to @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end
end

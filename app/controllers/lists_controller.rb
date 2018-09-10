class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    # TODO: revisit this

    create
    # @list = List.new
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

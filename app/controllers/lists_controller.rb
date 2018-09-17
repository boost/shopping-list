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

    if @list.valid?
      @list.save

      redirect_to @list
    else
      flash[:notice] = @list.errors.full_messages if @list.errors.count > 0

      redirect_to lists_path
    end
  end

  def update
    @list = List.find(params[:id])

    @list.update(list_params)
    @list.name = list_params[:name]

    @list.save if @list.valid?
    flash[:list_notice] = @list.errors.full_messages if @list.errors.count > 0

    redirect_to @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

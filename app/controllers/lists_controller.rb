class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = find_list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    # No need for app/views/lists/create.html.erb
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end

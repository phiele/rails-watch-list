class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = find_list
  end

  private

  def find_list
    @list = List.find(params[:id])
  end
end

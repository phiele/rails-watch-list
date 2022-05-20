class BookmarksController < ApplicationController
  # We need to find the list associated with the bookmark
  before_action :set_list, only: %i[new create]

  def new
    # We need @list in our `simple_form_for`
    @list = set_list
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
    raise
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

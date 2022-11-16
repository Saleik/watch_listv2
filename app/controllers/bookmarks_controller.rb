class BookmarksController < ApplicationController
  def create
    @new_bookmark = Bookmark.new(bookmark_params)
    if @new_bookmark.after_save
      redirect_to root_path, notice: 'New List successfully created!'
    else
      flash.now[:alert] = "Something goes wrong try again."
      render 'lists/new', status: 422
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end

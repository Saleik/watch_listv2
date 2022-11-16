class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.where(user: current_user)
  end

  def new
    @list = List.new
    @list.bookmarks.build
  end

  def create
    raise
  end

  private

  def list_params
    params.require(:list).permit(:name, bookmarks_attributes: [:comment, :movie])
  end
end

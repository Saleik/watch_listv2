class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.where(user: current_user)
  end

  def new
    @bookmark = Bookmark.new
    @list = List.new
  end

  def create
  end
end

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
    @list = List.new(
      name: list_params["name"],
      resume:list_params["resume"],
      user: current_user,
    )
    @list.bookmarks.build
    raise
    if @list.save
      redirect_to root_path, notice: "New List Successfully added!"
    else
      render new_list_path, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :resume, bookmarks_attributes: [:movie])
  end
end

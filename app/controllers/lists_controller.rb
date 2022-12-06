class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.where(user: current_user)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path, notice: "New List Successfully added!"
    else
      render new_list_path, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :name, :resume, :image, movies_array:[])
  end
end

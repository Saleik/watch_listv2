class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.where(user: current_user)
  end

  def new
    @lists = List.new
  end
end

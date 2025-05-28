class DashboardsController < ApplicationController
  def index
    @user = current_user
    @reservations = @user.reservations
    @items = @user.items
    @reviews = @user.reviews
    @comments = Comment.where(author_id: current_user)
  end
end

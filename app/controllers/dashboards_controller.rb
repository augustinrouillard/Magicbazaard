class DashboardsController < ApplicationController
  def index
    @user = current_user
    @reservations = @user.reservations
    @items = @user.items
    @reviews = @user.reviews
    @comments = @user.comments
  end
end

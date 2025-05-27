class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = User.find(params[:user_id])
    @comment = Comment.new
    @comments = Comment.where(target_id: @user.id)
  end
end

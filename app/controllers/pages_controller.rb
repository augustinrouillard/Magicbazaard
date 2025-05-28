class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = User.find(params[:user_id])
    @comment = Comment.new
    @comments = Comment.where(target_id: @user.id)
    allrating = @comments.map(&:rating)
    if allrating.count.zero? || allrating.all?(&:nil?)
      @user.rating = 0
    else
      @user.rating = allrating.sum.to_f / allrating.size
    end
  end
end

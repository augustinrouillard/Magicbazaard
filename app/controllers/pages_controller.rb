class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    @user1 = User.find(params[:user_id])
    @comment = Comment.new
    @comments = Comment.where(target_id: @user1.id)
    allrating = @comments.map(&:rating)
    if allrating.count.zero? || allrating.all?(&:nil?)
      @user1.rating = 0
    else
      @user1.rating = allrating.sum.to_f / allrating.size
    end
  end
end

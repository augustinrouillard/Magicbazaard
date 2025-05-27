class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @user = User.find(params[:user_id])
    @comment.author = current_user
    @comment.target = @user
    if @comment.save
      redirect_to user_path(@user)
    else
      @comment = Comment.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.author == current_user
      @comment.destroy
      @user = User.find(params[:user_id])
      redirect_to user_profile_path(@user)
    else
      redirect_to user_profile_path(@user), alert: "Action non autorisée."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

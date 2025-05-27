class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @user = User.find(params[:user_id])
    @comment.author = @user
    @comment.target = @comment.target_id
    if @comment.save
      redirect_to user_path(@user)
    else
      @comment = Comment.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_path(@user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :target_id)
  end
end

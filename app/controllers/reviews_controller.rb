class ReviewsController < ApplicationController

    def new
        @item = Item.find(params[:item_id])
        @review = Review.new(item: @item)
    end

    def create
        @review = Review.new(review_params)
        @review.user = current_user
                
    if @review.save
      redirect_to item_path(@review.item)
    else  
      render :new, status: :unprocessable_entity
    end

    end

    def destroy
        @review = Review.find(params[:id])
     if @review.user == current_user
        @review.destroy
     redirect_to item_path(@review.item)
     else  
      render :new, status: :unprocessable_entity
     end
    end


    private

    def review_params
      params.require(:review).permit(:content, :rating, :item_id)
    end


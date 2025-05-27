class RatingsController < ApplicationController
  def create
  @item = Item.find(params[:item_id])
  @rating = @item.ratings.find_or_initialize_by(user: current_user)
  @rating.score = rating_params[:score]

  if @rating.save
    redirect_to @item, notice: "Votre note a été enregistrée."
  else
    redirect_to @item, alert: "Impossible d'enregistrer la note."
  end
end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end
end

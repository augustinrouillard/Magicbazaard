class ReservationController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @user = @item.user
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @item = Item.find(params[:item_id])
    @reservation.item = @item
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(params[:reservation])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date)
  end
end

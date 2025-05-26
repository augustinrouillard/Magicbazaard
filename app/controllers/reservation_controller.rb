class ReservationController < ApplicationController
  def new
    @item = item.find(params[:item_id])
    @user = @item.user
    @reservation = Reservation.new
  end

  def create
    @item = item.find(params[:item_id])
    @user = @item.user
    @reservation = Reservation.new(reservation_params)
    @reservation.item = @item
    @reservation.user = @user
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = item.find(params[:item_id])
    @user = @item.user
    @reservation = Reservation.find(params[:id])
  end

  def uptade
    @reservation = Reservation.find(params[:id])
    @reservation.update(params[:reservation])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date)
  end
end

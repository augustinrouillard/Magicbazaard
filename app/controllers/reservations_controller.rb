class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @item = Item.find(params[:item_id])
    @user = @item.user
    @reservations = Reservation.all
    if params[:starting_date] && params[:ending_date]
      @starting_date = Date.parse(params[:starting_date])
      @ending_date = Date.parse(params[:ending_date])
      @duration = (@ending_date - @starting_date).to_i
      @total_price = @item.price * @duration
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @item = Item.find(params[:item_id])
    @reservation.item = @item
    @reservation.user = current_user
    if @reservation.save
      redirect_to dashboards_path, notice: "Réservation confirmée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @item = @reservation.item
    @user = @item.user
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.item = @item
    @reservation.user = current_user
    if @reservation.update(reservation_params)
      redirect_to dashboards_path, notice: "Réservation mise à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date, :item_id)
  end
end

class ReservationsController < ApplicationController
  def new
  @item = Item.find(params[:item_id])
  
  @starting_date = parse_date(params[:start_date])
  @ending_date = parse_date(params[:end_date])

  if @starting_date && @ending_date
    @duration = (@ending_date - @starting_date).to_i
    @total_price = @duration * @item.price
  end

  @reservation = Reservation.new(
    starting_date: @starting_date,
    ending_date: @ending_date,
    item: @item
  )
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

  def parse_date(param)
    Date.parse(param) rescue nil
  end
end

class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    session[:booking] = Booking.new(bookings_params)
    session[:prestations] = params[:booking][:prestation_ids]
    redirect_to new_pros_booking_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:email, :name, :address)
  end
end

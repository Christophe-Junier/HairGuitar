class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.prestations << Prestation.where(id: params[:booking][:prestation_ids])
    redirect_to new_booking_pro_path(booking: @booking)
  end

  private

  def bookings_params
    params.require(:booking).permit(:email, :name, :address)
  end
end

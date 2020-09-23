# frozen_string_literal: true

# Controller to do booking
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.geocode(@booking.address)
    if @booking.save
      redirect_to bookings_available_pros_path, notice: "Booking created successfully !"
    else
      redirect_back(fallback_location: root_path, alert: @booking.errors.messages)
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:email, :name, :address, :starts_at, prestation_ids: [])
  end
end

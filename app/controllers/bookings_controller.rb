# frozen_string_literal: true

# Controller to do booking
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
  end

  private

  def bookings_params
    params.require(:booking).permit(:email, :name, :address, :starts_at, prestation_ids: [])
  end
end

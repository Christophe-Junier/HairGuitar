# frozen_string_literal: true

module Bookings
  # Controller to choose available pros for a booking.
  class ProsController < ApplicationController
    def new
      @booking = Booking.find(params[:booking_id])
      @pros = AvailableProForBookingService.new(@booking).process_all
    end

    def create
      @booking = Booking.find(params[:booking_id])
      if @booking.update(pro_id: params[:pro][:pro_id])
        create_appointment(@booking)
        redirect_to root_path
      else
        redirect_back(fallback_location: root_path, alert: @booking.errors.messages)
      end
    end

    private

    def create_appointment(booking)
      Appointment.create(starts_at: booking.starts_at,
                         ends_at: booking.starts_at + booking.prestations.pluck(:duration).sum.minutes,
                         pro_id: booking.pro_id)
    end
  end
end

# frozen_string_literal: true

module Bookings
  # Controller to choose available pros for a booking.
  class ProsController < ApplicationController
    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/AbcSize
    def new
      @booking = Booking.find(params[:booking_id])
      booking_end_time = @booking.starts_at + @booking.prestations.pluck(:duration).sum.minutes

      # Pros that can are open at booking time
      # Problems on time type on postgres that always add a date on time type column
      # Solving by forcing the same date on time comparison
      open_pros = Pro.joins(:opening_hours)
                     .where('opening_hours.day = ? AND opening_hours.starts_at < ? AND opening_hours.ends_at > ?',
                            @booking.starts_at.strftime('%A').downcase,
                            @booking.starts_at.strftime('Sat, 01 Jan 2000 %H:%M:%S UTC +00:00').to_time,
                            @booking.starts_at.strftime('Sat, 01 Jan 2000 %H:%M:%S UTC +00:00').to_time)

      # Pros that can dont have crossing appointments
      no_crossing_appointment_pros = open_pros.joins(:appointments)
                                              .where.not('appointments.starts_at < ? AND appointments.ends_at > ?
                                                         AND appointments.starts_at < ? AND appointments.ends_at > ?',
                                                         @booking.starts_at, @booking.starts_at,
                                                         booking_end_time, booking_end_time)

      # Pros that can handle booking prestations
      available_for_prestations_pros = no_crossing_appointment_pros.joins(:prestations)
                                                                   .where.not(
                                                                     prestations: {
                                                                       id: Prestation.pluck(:id) - \
                                                                           @booking.prestations.ids
                                                                     }
                                                                   ).uniq

      # Pros with max distance that are within booking distance
      available_for_prestations_pros.each_with_index do |pro, index|
        address_distance_service = GoogleAddressDistanceCalculationService.new
        distance = address_distance_service.get_pro_booking_distance(pro, @booking).to_i
        available_for_prestations_pros.delete_at(index) unless distance <= pro.max_kilometers
      end
      @pros = available_for_prestations_pros
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize

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

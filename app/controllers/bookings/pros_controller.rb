# frozen_string_literal: true

# Controller to choose available pros for a booking.
class Bookings::ProsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])

    # Pros that can handle needed prestations
    # Problems on time type on postgres that always add a date on time type column
    # Solving by forcing the same date on time comparison
    open_pros = Pro.joins(:opening_hours)
                   .where('opening_hours.day = ? AND opening_hours.starts_at < ? AND opening_hours.ends_at > ?',
                     @booking.starts_at.strftime('%A').downcase,
                     @booking.starts_at.strftime('Sat, 01 Jan 2000 %H:%M:%S UTC +00:00').to_time,
                     @booking.starts_at.strftime('Sat, 01 Jan 2000 %H:%M:%S UTC +00:00').to_time
                   )

    no_crossing_appointment_pros = open_pros.joins(:appointments)
                                            .where.not('appointments.starts_at < ? AND appointments.ends_at > ?',
                                              @booking.starts_at,
                                              @booking.starts_at
                                            )

    available_for_prestations_pros = no_crossing_appointment_pros.joins(:prestations)
                                                                 .where.not(
                                                                   prestations: {
                                                                     id: Prestation.pluck(:id) - @booking.prestations.ids
                                                                   }
                                                                 ).uniq

    available_for_prestations_pros.each_with_index do |pro, index|
      address_distance_service = GoogleAddressDistanceCalculationService.new
      distance = address_distance_service.get_pro_booking_distance(pro, @booking).to_i
      available_for_prestations_pros.delete_at(index) unless distance <= pro.max_kilometers
    end

    @pros = available_for_prestations_pros
  end
end

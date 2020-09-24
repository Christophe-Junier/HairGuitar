# frozen_string_literal: true

# Service to return available pro for a booking
class AvailableProForBookingService
  def initialize(booking)
    @booking = booking
    @booking_end_time = @booking.starts_at + \
                        @booking.prestations.pluck(:duration).sum.minutes
  end

  # Processing all methods to get the available pro list for a booking
  def process_all
    @pros = open_pros
    @pros = no_crossing_appointment_pros
    @pros = available_for_prestations_pros
    @pros = avaible_at_booking_distance_pro
    @pros.uniq
  end

  # Pros that can are open at booking time
  # Problems on time type on postgres that always add a date on time type column
  # Solving by forcing the same date on time comparison
  def open_pros
    Pro.joins(:opening_hours)
       .where('opening_hours.day = ? AND opening_hours.starts_at < ? AND opening_hours.ends_at > ?',
              @booking.starts_at.strftime('%A').downcase,
              @booking.starts_at.strftime('Sat, 01 Jan 2000 %H:%M:%S UTC +00:00').to_time,
              @booking.starts_at.strftime('Sat, 01 Jan 2000 %H:%M:%S UTC +00:00').to_time)
  end

  # Pros that can dont have crossing appointments
  def no_crossing_appointment_pros
    @pros.left_outer_joins(:appointments)
         .where.not('appointments.starts_at < ? AND appointments.ends_at > ?
                    AND appointments.starts_at < ? AND appointments.ends_at > ?',
                    @booking.starts_at, @booking.starts_at,
                    @booking_end_time, @booking_end_time)
  end

  # Pros that can handle booking prestations
  def available_for_prestations_pros
    @pros.joins(:prestations)
         .where.not(
           prestations: {
             id: Prestation.pluck(:id) - \
                 @booking.prestations.ids
           }
         )
  end

  # Pros with max distance that are within booking distance
  def avaible_at_booking_distance_pro
    @pros.each_with_index do |pro, index|
      distance = GoogleAddressDistanceCalculationService.new(pro, @booking).pro_booking_distance
      @pros.delete_at(index) unless distance.to_i <= pro.max_kilometers
    end
  end
end

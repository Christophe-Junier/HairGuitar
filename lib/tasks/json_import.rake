namespace :db do
  namespace :json do

    desc 'import a json file in the database'
    task import: :environment do
      # File Processing
      json_file_path = File.join Rails.root, 'data.json'
      json_file      = File.open(json_file_path).read

      # Datas conversion to OpenStruct
      datas          = JSON.parse(json_file, object_class: OpenStruct)

      # Datas Itération
      datas.prestations.each{ |prestation| prestation_creation(prestation) }
      datas.pros.each{ |pro| pro_creation(pro) }
      datas.bookings.each{ |booking| booking_creation(booking) }
    end

    # Prestation creation method stands here, in case of complexification of model.
    def prestation_creation(prestation)
      Prestation.create(prestation.to_h)
    end

    # Pro creation method stands here
    def pro_creation(pro)
      this_pro = Pro.create(name: pro.name,
                            address: pro.address,
                            lat: pro.lat,
                            lng: pro.lng,
                            max_kilometers: pro.max_kilometers)
      pro.opening_hours.each{ |opening_hour| opening_hour_creation(opening_hour, this_pro) }
      pro.appointments.each{ |appointment| appointment_creation(appointment, this_pro) }
      pro.prestations.each{ |pro_prestation| pro_prestation_creation(pro_prestation, this_pro)}
    end

    # Booking creation method stands here
    def booking_creation(booking)
      this_booking = Booking.create(email: booking.email,
                                    name: booking.name,
                                    starts_at: booking.starts_at,
                                    address: booking.address,
                                    lat: booking.lat,
                                    lng: booking.lng)
      booking.prestations.each{ |booked_prestation| booked_prestation_creation(booked_prestation, this_booking)}
    end

    # Opening hour creation method stands here
    def opening_hour_creation(opening_hour, this_pro)
      opening_hour.pro_id = this_pro.id
      OpeningHour.create( opening_hour.to_h )
    end

    # Appointment creation method stands here
    def appointment_creation(appointment, this_pro)
      appointment.pro_id = this_pro.id
      Appointment.create( appointment.to_h )
    end

    # ProsPrestation creation method stands here
    def pro_prestation_creation(pro_prestation, this_pro)
      ProsPrestation.create(pro_id: this_pro.id, prestation_id: Prestation.find_by(reference: pro_prestation).id )
    end

    # BookedPrestation creation method stands here
    def booked_prestation_creation(booked_prestation, this_booking)
      BookedPrestation.create(booking_id: this_booking.id, prestation_id: Prestation.find_by(reference: booked_prestation).id )
    end
  end
end

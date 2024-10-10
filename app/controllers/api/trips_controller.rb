class Api::TripsController < ApiController
  rescue_from Trips::Distance::DestinationAddressMissingError,
              Trips::Distance::StartAddressMissingError, with: :render_error

  def create
    trip = Trip.new(trip_params)
    trip.distance = Trips::Distance.new(trip).to_m

    if trip.save
      render json: trip, status: :created
    else
      render json: { errors: trip.errors }, status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.permit(:start_address, :destination_address, :price, :date)
  end
end

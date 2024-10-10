class ApplicationSerializer < ActiveModel::Serializer
  include ActiveSupport::NumberHelper

  private

  def meters_to_formatted_kilometers(meters)
    "#{Meters.new(meters).to_km}km"
  end
end

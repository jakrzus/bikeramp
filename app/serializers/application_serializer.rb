class ApplicationSerializer < ActiveModel::Serializer
  include ActiveSupport::NumberHelper

  private

  def meters_to_formatted_kilometers(meters)
    "#{Meters.new(meters).to_km}km"
  end

  def formatted_date(date)
    month = I18n.l(date, format: :month)
    day = date.day.ordinalize
    "#{month}, #{day}"
  end
end

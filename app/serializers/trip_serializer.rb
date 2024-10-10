# == Schema Information
#
# Table name: trips
#
#  id                  :bigint           not null, primary key
#  date                :date
#  destination_address :string
#  distance            :integer
#  price               :decimal(8, 2)
#  start_address       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class TripSerializer < ApplicationSerializer
  attributes :id, :start_address, :destination_address, :price, :date, :distance

  def date
    month = I18n.l(object.date, format: :month)
    day = object.date.day.ordinalize
    "#{month}, #{day}"
  end

  def distance
    km = (object.distance / 1000.0).round(2)

    "#{km}km"
  end

  def price
    number_to_currency(object.price, unit: "PLN", precision: 2, format: "%n%u")
  end
end

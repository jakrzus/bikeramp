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
    formatted_date(object.date)
  end

  def distance
    meters_to_formatted_kilometers(object.distance)
  end

  def price
    formatted_price(object.price)
  end
end

# == Schema Information
#
# Table name: trips
#
#  id                  :bigint           not null, primary key
#  date                :date             not null
#  destination_address :string           not null
#  distance            :integer          not null
#  price               :decimal(8, 2)    not null
#  start_address       :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Trip < ApplicationRecord
  validates :start_address, :destination_address, :price, :date, :distance, presence: true
end

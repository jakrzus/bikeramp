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
class Trip < ApplicationRecord
end

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
FactoryBot.define do
  factory :trip do
    start_address { "Plac Dąbrowskiego 1, Warszawa, Polska" }
    destination_address { "Plac Europejski 2, Warszawa, Polska" }
    price { "9.99" }
    date { "2024-10-10" }
    distance { 121 }
  end
end

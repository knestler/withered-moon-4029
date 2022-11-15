class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights
  
  def adult_passengers
    require 'pry'; binding.pry
        passengers
    .where('age >= 18')
    .distinct
    .pluck(:name)
  end
end

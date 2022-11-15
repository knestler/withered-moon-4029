require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
    it {should have_many(:passengers).through(:flights)}
  end
 
  before :each do 
    @airline1 = Airline.create!(name: 'united')
    @airline2 = Airline.create!(name: 'Delta')

    @flight1 = @airline1.flights.create!(number: 1427, date: '11/09/22', departure_city: 'LGA', arrival_city: 'HPN')
    @flight2 = @airline1.flights.create!(number: 7230, date: '11/10/22', departure_city: 'JFK', arrival_city: 'LGA')
    @flight3 = @airline2.flights.create!(number: 6589, date: '11/18/22', departure_city: 'EWR', arrival_city: 'EWR') 
    @flight4 = @airline2.flights.create!(number: 666, date: '11/22/22', departure_city: 'HPN', arrival_city: 'JFK')

    @passenger1 = Passenger.create!(name: 'ken', age: 32)
    @passenger2 = Passenger.create!(name: 'deb', age: 78)
    @passenger3 = Passenger.create!(name: 'dan', age: 15)
    @passenger4 = Passenger.create!(name: 'rob', age: 34)
    @passenger5 = Passenger.create!(name: 'ron', age: 54)
    @passenger6 = Passenger.create!(name: 'joe', age: 45)
    @passenger7 = Passenger.create!(name: 'col', age: 28)

    @flight_passenger1 = FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @passenger7.id)
    @flight_passenger2 = FlightPassenger.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @flight_passenger3 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight3.id)
    @flight_passenger4 = FlightPassenger.create!(passenger_id: @passenger6.id, flight_id: @flight1.id)
    @flight_passenger5 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight2.id)
    @flight_passenger6 = FlightPassenger.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @flight_passenger7 = FlightPassenger.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
    @flight_passenger8 = FlightPassenger.create!(passenger_id: @passenger1.id, flight_id: @flight3.id)
    @flight_passenger9 = FlightPassenger.create!(passenger_id: @passenger6.id, flight_id: @flight3.id)
    @flight_passenger10 = FlightPassenger.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
  end
  
  describe 'model tests' do
    it '#adult_passengers' do
      expect(@airline1.adult_passengers).to eq(["deb", "joe", "ken", "rob", "ron"])
      expect(@airline2.adult_passengers).to eq(["col", "joe", "ken", "ron"])
    end
  end
end

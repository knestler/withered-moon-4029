require 'rails_helper'

RSpec.describe 'Flights Index', type: :feature do
  before :each do 
    @airline1 = Airline.create!(name: 'united')
    @airline2 = Airline.create!(name: 'Delta')

    @flight1 = @airline1.flights.create!(number: 1427, date: '11/09/22', departure_city: 'LGA', arrival_city: 'HPN')
    @flight2 = @airline1.flights.create!(number: 7230, date: '11/10/22', departure_city: 'JFK', arrival_city: 'LGA')
    @flight3 = @airline1.flights.create!(number: 6589, date: '11/18/22', departure_city: 'EWR', arrival_city: 'EWR') 
    @flight4 = @airline2.flights.create!(number: 666, date: '11/22/22', departure_city: 'HPN', arrival_city: 'JFK')

    @passenger1 = Passenger.create!(name: 'ken', age: 32)
    @passenger2 = Passenger.create!(name: 'deb', age: 78)
    @passenger3 = Passenger.create!(name: 'dan', age: 15)
    @passenger4 = Passenger.create!(name: 'rob', age: 34)
    @passenger5 = Passenger.create!(name: 'ron', age: 54)
    @passenger6 = Passenger.create!(name: 'joe', age: 45)
    @passenger7 = Passenger.create!(name: 'col', age: 28)

    @flight_passenger1 = FlightPassenger.create!(passenger: @passenger7, flight: @flight4)
    @flight_passenger2 = FlightPassenger.create!(passenger: @passenger2, flight: @flight1)
    @flight_passenger3 = FlightPassenger.create!(passenger: @passenger5, flight: @flight3)
    @flight_passenger4 = FlightPassenger.create!(passenger: @passenger6, flight: @flight1)
    @flight_passenger5 = FlightPassenger.create!(passenger: @passenger5, flight: @flight2)
    @flight_passenger6 = FlightPassenger.create!(passenger: @passenger3, flight: @flight2)
    @flight_passenger7 = FlightPassenger.create!(passenger: @passenger4, flight: @flight2)
    @flight_passenger8 = FlightPassenger.create!(passenger: @passenger1, flight: @flight3)
    @flight_passenger9 = FlightPassenger.create!(passenger: @passenger6, flight: @flight3)
    @flight_passenger10 = FlightPassenger.create!(passenger: @passenger1, flight: @flight1)
  end

  it 'lists of all flight numbers, name of the Airline, and names of all that flights passengers' do 
    visit flights_path
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@airline1.name)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger6.name)
  end

  
end   

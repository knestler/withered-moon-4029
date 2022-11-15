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

    @flight_passenger10 = FlightPassenger.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @flight_passenger2 = FlightPassenger.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @flight_passenger4 = FlightPassenger.create!(passenger_id: @passenger6.id, flight_id: @flight1.id)
    @flight_passenger6 = FlightPassenger.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @flight_passenger7 = FlightPassenger.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
    @flight_passenger5 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight2.id)
    @flight_passenger8 = FlightPassenger.create!(passenger_id: @passenger1.id, flight_id: @flight3.id)
    @flight_passenger3 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight3.id)
    @flight_passenger9 = FlightPassenger.create!(passenger_id: @passenger6.id, flight_id: @flight3.id)
    @flight_passenger1 = FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @passenger7.id)
  end

  it 'lists of all flight numbers, name of the Airline, and names of all that flights passengers' do 
    visit flights_path
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@airline1.name)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger6.name)
      expect(page).to have_link("Remove Passenger")
  end

  it 'can remove one passenger from a flight' do 
    visit flights_path

    within "#flight-#{@flight1.id}" do       
      within "#passenger-#{@passenger1.id}" do 
        expect(page).to have_link("Remove Passenger")
      end
      within "#passenger-#{@passenger2.id}" do 
        expect(page).to have_link("Remove Passenger")
      end
      within "#passenger-#{@passenger6.id}" do 
        expect(page).to have_link("Remove Passenger")      
      end
    end

    within "#flight-#{@flight3.id}" do       
      within "#passenger-#{@passenger1.id}" do 
        expect(page).to have_link("Remove Passenger")
      end
      within "#passenger-#{@passenger5.id}" do 
        expect(page).to have_link("Remove Passenger")      
      end
      within "#passenger-#{@passenger6.id}" do 
        expect(page).to have_link("Remove Passenger")      
        
        click_link("Remove Passenger")
      end
    end

    expect(current_path).to eq(flights_path)

    within "#flight-#{@flight1.id}" do 
      expect(page).to have_content("joe") 
    end
    within "#flight-#{@flight3.id}" do 
      expect(page).to_not have_content("joe") 
    end
  end 
end   

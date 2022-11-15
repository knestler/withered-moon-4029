  class FlightPassengersController < ApplicationController
  
  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:id])
    flight_passenger = FlightPassenger.find_by(flight: params[:flight_id], passenger: params[:id])
    
    flight_passenger.destroy

    redirect_to ("/flights")
  end

end
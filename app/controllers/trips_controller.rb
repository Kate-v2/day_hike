
class TripsController < ApplicationController


  def index
    @trips = Trip.all
    # list of all trips
    # title are links to show
  end


  def show
    @trip   = Trip.find(params[:id].to_i)
    @trails = @trip.trails
    # trails included in that trip
    # name, address, length of each trail
    # trail names link to trail show
    # --- stats ---
    #  - total distance of trip (all trials)
    #  - average distance of each trail on that trip
    #  - longest trail of that trip (longest distance, not just the name)
    #  - shortest trail of that trip (shortest distance, not just the name)
  end






end

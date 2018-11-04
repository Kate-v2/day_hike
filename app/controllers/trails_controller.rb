

class TrailsController < ApplicationController





  def show
    @trail = Trail.find(params[:id].to_i)
    # name
    # address
    # -----
    # total number of trips that include this hike
    # name of every trip, & total length of trip
  end






end

require 'rails_helper'

describe Trip, type: :model do

  describe 'Relationships' do
    it { should have_many :trip_trails }
    it { should have_many :trails }
  end

  before(:each) do
    @trip   = Trip.create!(name: "Trip 1", start_date: DateTime.now, end_date: DateTime.now)

    @trail1 = Trail.create!(name: "Trail 1", length: 1, address: "address 1")
    @trail2 = Trail.create!(name: "Trail 2", length: 2, address: "address 2")
    @trail3 = Trail.create!(name: "Trail 3", length: 3, address: "address 3")
    @trail4 = Trail.create!(name: "Trail 4", length: 4, address: "address 4")

    TripTrail.create!(trip: @trip, trail: @trail1)
    TripTrail.create!(trip: @trip, trail: @trail2)
    TripTrail.create!(trip: @trip, trail: @trail3)
    TripTrail.create!(trip: @trip, trail: @trail4)

  end



  describe 'Summary' do

    it 'total distance of all trails on a trip' do
      total    = @trip.distance
      expected = 1 + 2 + 3 + 4
      expect(total).to eq(expected)
    end

    it 'finds the longest hike' do
      found    = @trip.longest_hike
      expect(found).to eq(@trail4)
    end

    it 'finds the shortest hike' do
      found    = @trip.shortest_hike
      expect(found).to eq(@trail1)
    end

    it 'finds the average hike distance' do
      average = ((1 + 2 + 3 + 4) / 4.0)
      calc    = @trip.average_distance
      expect(calc).to eq(average)
    end

  end


end

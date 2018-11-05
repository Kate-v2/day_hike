require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe 'Relationships' do
    it { should have_many :trip_trails}
    it { should have_many :trips }
  end

  before(:each) do
    @trip1   = Trip.create!(name: "Trip 1", start_date: DateTime.now, end_date: DateTime.now)
    @trip2   = Trip.create!(name: "Trip 2", start_date: DateTime.now, end_date: DateTime.now)
    @trip3   = Trip.create!(name: "Trip 3", start_date: DateTime.now, end_date: DateTime.now)
    @trip4   = Trip.create!(name: "Trip 4", start_date: DateTime.now, end_date: DateTime.now)

    @trail1 = Trail.create!(name: "Trail 1", length: 1, address: "address 1")


    TripTrail.create!(trip: @trip1, trail: @trail1)
    TripTrail.create!(trip: @trip2, trail: @trail1)
    TripTrail.create!(trip: @trip3, trail: @trail1)
    TripTrail.create!(trip: @trip4, trail: @trail1)

  end

  describe 'Summary' do

    it 'calculates the number of trips that include this hike' do
      ct    = TripTrail.count
      found = @trail1.trip_count
      expect(found).to eq(ct)
    end


  end
end

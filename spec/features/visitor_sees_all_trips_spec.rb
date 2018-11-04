require "rails_helper"


describe 'All trips' do

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

    visit trips_path
    @links = page.all('a')

  end

  it 'displays all' do
    ct = @links.count
    expect(ct).to eq(4)
  end

  it 'links to each trip page' do
    @links.first.click
    expect(page).to have_current_path(trip_path(@trip1))
  end









end

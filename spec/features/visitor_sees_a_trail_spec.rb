require "rails_helper"


describe 'Trail Details' do

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

    visit trail_path(@trail1)

  end

  it 'has trail details' do
    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail1.length)
    expect(page).to have_content(@trail1.address)
    expect(page).to have_content(@trail1.trip_count)
  end

  it 'links to trips' do
    links = page.all('a')
    expect(links.count).to eq(4)
    link = links.first
    link.click
    expect(page).to have_current_path(trip_path(@trip1))
  end

  it 'displays total distance per trip' do
    card = page.all('.card').first
    expect(card).to have_content(@trip1.distance)
  end



end

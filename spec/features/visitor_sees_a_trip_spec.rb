require "rails_helper"


describe 'Visitor can see trip details' do

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


    visit trip_path(@trip)


  end



  it 'name' do
    expect(page).to have_content(@trip.name)
  end

  describe 'Collection' do

    before(:each) do
      @collection = page.find('.collection')
      @cards      = page.all('.card')
      @card       = @cards.first
    end

    it 'all trails' do
      expect(@collection).to have_content(@trail1.name)
      expect(@collection).to have_content(@trail2.name)
      expect(@collection).to have_content(@trail3.name)
      expect(@collection).to have_content(@trail4.name)
    end

    it 'facts about each trail' do
      expect(@card).to have_content(@trail1.name)
      expect(@card).to have_content(@trail1.length)
      expect(@card).to have_content(@trail1.address)
    end

    it 'links to trail show page' do
      @card.click_on("#{@trail1.name}")
      expect(page).to have_current_path(trail_path(@trail1))
    end
  end

  describe 'stats' do

    before(:each) do
      @stats = page.find('.stats')
    end

    it 'total distance' do
      expect(page).to have_content("Total Distance: #{@trip.distance}")
    end

    it 'average distance' do
      expect(page).to have_content("Average Distance: #{@trip.average_distance}")
    end

    it 'Longest Trail' do
      expect(page).to have_content("Longest: #{@trip.longest_hike.name} at #{@trip.longest_hike.length}")
    end

    it 'Shortest Trail' do
      expect(page).to have_content("Shortest: #{@trip.shortest_hike.name} at #{@trip.shortest_hike.length}")
    end

    it 'longest & shortest are links to trail show pages' do
      @stats.click_on("#{@trail1.name}")
      expect(page).to have_current_path(trail_path(@trail1))

      @stats.click_on("#{@trail4.name}")
      expect(page).to have_current_path(trail_path(@trail4))
    end

  end



end


def page_pry
  save_and_open_page
  binding.pry
end

require 'rails_helper'

RSpec.describe TripTrail, type: :model do

  describe 'Relationships' do
    it { should belong_to :trails }
    it { should belong_to :trips }
  end



end

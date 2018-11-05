require 'rails_helper'

RSpec.describe TripTrail, type: :model do

  describe 'Relationships' do
    it { should belong_to :trail }
    it { should belong_to :trip }
  end



end

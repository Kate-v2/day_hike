require 'rails_helper'

describe Trip, type: :model do

  describe 'Relationships' do
    it { should have_many :trip_trails }
    it { should have_many :trails }
  end




end

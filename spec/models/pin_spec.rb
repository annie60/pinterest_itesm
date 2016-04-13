require 'rails_helper'

RSpec.describe Pin, :type => :model do
  let(:pin) { FactoryGirl.build(:pin) }
  subject { pin }

  it { should have_many(:placements) }
  it { should have_many(:boards).through(:placements) }
end

require 'rails_helper'

RSpec.describe Placement, :type => :model do
  let(:placement) { FactoryGirl.create(:placement) }
  subject { placement }

  it { should belong_to(:board) }
  it { should belong_to(:pin) }
end

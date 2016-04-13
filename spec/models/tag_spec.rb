require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag) { FactoryGirl.build(:tag) }
  subject { tag }

  it { should belong_to(:board) }
end

FactoryGirl.define do
  factory :tag do
    board
    title { FFaker::Lorem.words.first }
  end
end

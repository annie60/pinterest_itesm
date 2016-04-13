FactoryGirl.define do
  factory :board do
    name { FFaker::Lorem.words.join }
    user
  end
end

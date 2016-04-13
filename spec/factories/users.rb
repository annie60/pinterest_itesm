FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    username { FFaker::Internet.user_name }
    avatar "avatar.png"
    password "12345678"
    password_confirmation "12345678"
  end
end

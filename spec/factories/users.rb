FactoryGirl.define do
  factory :user do
    name     {Faker::Name.name}
    email    {Faker::Internet.email}
    password {Faker::Internet.password(8)}


    factory :facebook_user do
      provider "facebook"
      uid { Faker::Number.number(15) }
    end
  end
end
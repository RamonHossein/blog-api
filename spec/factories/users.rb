FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email "user@email.com"
    password "pass1234"
  end
end

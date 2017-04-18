FactoryGirl.define do
  factory :comment do
    author { Faker::StarWars.character }
    content { Faker::Lorem.paragraph }
    post_id nil
  end
end

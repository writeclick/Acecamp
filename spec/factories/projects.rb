require 'faker'

FactoryGirl.define do
  factory :project do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph(sentence_count = 3, supplemental = false) }
    user_id 1
  end
end
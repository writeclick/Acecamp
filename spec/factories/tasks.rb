require 'faker'

FactoryGirl.define do
  factory :task do
    name { Faker::Name.title }
    description { Faker::Lorem.paragraph(sentence_count = 3, supplemental = false) }
    tasklist_id 1
  end
end

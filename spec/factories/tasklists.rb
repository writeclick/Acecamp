require 'faker'

FactoryGirl.define do
  factory :tasklist do
    name { Faker::Name.title }
    project_id 1
  end
end

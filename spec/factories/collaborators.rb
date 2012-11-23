# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collaborator do
    sequence(:user_id) { |n| "{n}" }
    project_id 1
  end
end

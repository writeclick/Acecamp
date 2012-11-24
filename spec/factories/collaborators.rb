# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collaborator do
    sequence(:user_id) { |n| "{n}" }
    sequence(:project_id) { |n| "{n}" }
  end
end

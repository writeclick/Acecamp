FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence (:email) { |count| "username#{count}@email.com" }
    password "foobar"
    password_confirmation "foobar"
  end
end
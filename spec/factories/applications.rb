# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application do
    title "GMail"
    url "http://mail.google.com"
    user_id 1
  end
end

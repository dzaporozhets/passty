# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application do
    title "MyString"
    url "MyString"
    description "MyText"
    user_id 1
  end
end

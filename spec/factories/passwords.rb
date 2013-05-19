# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :password do
    title "MyString"
    description "MyText"
    application_id 1
    password "MyString"
  end
end

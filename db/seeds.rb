# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.to_s == 'development'
  user = User.create(
    id: 1,
    email: "js@local.host",
    password: "12345678",
    password_confirmation: "12345678",
  )

  (1..30).each  do |i|
    begin
      user.applications.create(
        title: Faker::Internet.domain_name,
        url: Faker::Internet.uri('http'),
        description: Faker::Lorem.sentence,
      )
      print '.'
    rescue ActiveRecord::RecordNotSaved
      print 'F'
    end
  end

  user.applications.each do |app|
    3.times do
      begin
        app.passwords.create(password: '1jyaa46DA17x89', title: Faker::Name.first_name.downcase)
        print '.'
      rescue ActiveRecord::RecordNotSaved
        print 'F'
      end
    end
  end
end

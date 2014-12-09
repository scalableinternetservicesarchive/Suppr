# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

img = File.open(Rails.root.join('app', 'assets', 'images', 'original', 'suppr_default.jpg'))

N = 5
NC = 10
     
for i in 0..N
  user = User.new(
                     :first_name => "user" + i.to_s,
                     :last_name => "user" + i.to_s,
                     :email => i.to_s + "@email.com",
                     :password => "asdasdasd",
                     :password_confirmation => 'asdasdasd',
                     :n_hosted => 1,
                     :image => File.open(Rails.root.join('app', 'assets', 'images', 'medium', 'johndoe.jpg'))
                     )
  user.save!

  n = rand(1..365*60)
  dinner = Dinner.new(
                :host => user, 
                :date => n.days.from_now, 
                :location => "Test1", 
                :title => "test", 
                :description => "test", 
                :category => "Italian", 
                :price => 5.0, 
                :seats => 5, 
                :seats_available => 5, 
                :stamp => DateTime.current(), 
                :created_at => DateTime.current(), 
                :updated_at => DateTime.current(), 
                :image => img,
                :currency => '$'
                )
  dinner.save!

  for i in 0..NC
    Comment.create(
                   :user => user, 
                   :dinner => dinner, 
                   :content => "Cantami o diva del pelide Achille l ira funesta."
                   )
  end
end


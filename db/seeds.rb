# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dinner.create!(:date => 1.days.from_now, :location => "Test1", :title => "test", :description => "test", :category => "Italian", :price => 5.0, :seats_available => 5, :stamp => DateTime.current(), :created_at => DateTime.current(), :updated_at => DateTime.current(), :photo => "http://www.niceplacesonearth.com/wp-content/uploads/2014/07/best-food-subotica-620x264.jpg")
Dinner.create!(:date => 2.days.from_now, :location => "Test1", :title => "test", :description => "test", :category => "American", :price => 5.0, :seats_available => 5, :stamp => DateTime.current(), :created_at => DateTime.current(), :updated_at => DateTime.current(), :photo => "2014-10-27 00:33:36.434062','2014-10-27 23:32:36.467122','http://www.niceplacesonearth.com/wp-content/uploads/2014/07/mega-bounty-shot.jpg")
Dinner.create!(:date => 3.days.from_now, :location => "Test1", :title => "test", :description => "test", :category => "American", :price => 5.0, :seats_available => 5, :stamp => DateTime.current(), :created_at => DateTime.current(), :updated_at => DateTime.current(), :photo => "2014-10-27 00:33:36.434062','2014-10-27 23:32:36.467122','http://4.bp.blogspot.com/-UtlR9-MwTL0/Uw6iFJvvhoI/AAAAAAAAk5Q/s6yB_x23wFk/s640/DSC_0166jk.jpg")
Dinner.create!(:date => 4.days.from_now, :location => "Test1", :title => "test", :description => "test", :category => "American", :price => 5.0, :seats_available => 5, :stamp => DateTime.current(), :created_at => DateTime.current(), :updated_at => DateTime.current(), :photo => "2014-10-27 00:33:36.434062','2014-10-27 23:32:36.467122','http://cdn.superbwallpapers.com/wallpapers/photography/hamburger-6709-400x250.jpg")

class Dinner < ActiveRecord::Base
	validates :location, :description, :title, :category, :price, :seats_available, presence: true
	validates_numericality_of :seats_available, :price, :greater_than_or_equal_to =>0
	
end

class Dinner < ActiveRecord::Base
  CATEGORIES = ["American", "Chinese", "Italian", "Japanese", "Indian"]
	validates :location, :description, :title, :category, :price, :seats_available, presence: true
	validates_numericality_of :seats_available, :price, :greater_than_or_equal_to =>0
	validate :not_past_date

	def not_past_date
		if self.date.past?
			errors.add(:date, 'Dinner can not be hosted in the past')
		end
	end
end

class Dinner < ActiveRecord::Base
	validates :location, :description, :title, :category, :price, :seats_available, presence: true
	validates_numericality_of :seats_available, :price, :greater_than_or_equal_to =>0
	#validates_inclusion_of :date, :in => DateTime.now.to_date .. 365.days.since(DateTime.now).to_date
	validate :not_past_date

	def not_past_date
		if self.date.past?
			errors.add( :date, 'Dinner can not be hosted in the past')
		end
	end
end

class Dinner < ActiveRecord::Base
  has_many :reservations
  has_many :users, :through => :reservations
  belongs_to :host, :class_name => "User"
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  CATEGORIES = ["American", "Chinese", "Italian", "Japanese", "Indian"]
	validates :location, :description, :title, :category, :price, :seats, :host, presence: true
	validates_numericality_of :seats, :price, :greater_than_or_equal_to =>0
	validate :not_past_date
  validates :seats, numericality: { :greater_than_or_equal_to => :seats_available}

	def not_past_date
		if self.date.past?
			errors.add(:date, 'Dinner can not be hosted in the past')
		end
	end
end

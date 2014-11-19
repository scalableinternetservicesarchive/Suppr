# -*- coding: utf-8 -*-
class Dinner < ActiveRecord::Base
  default_scope { order("date ASC") }
  geocoded_by :location
  after_validation :geocode

  has_many :reservations, :dependent => :delete_all
  has_many :users, :through => :reservations
  belongs_to :host, :class_name => "User"
  has_many :comments, :dependent => :destroy

  has_attached_file :image, :styles => {
    :big => "500x500>",
    :medium => "300x300>",
    :small => "200x200>",
    :thumb => "100x100>"
  },
  :default_url => ":style/suppr_default.jpg"

  CATEGORIES = ["American", "Chinese","Indian", "Italian", "Japanese", "Thai", "Other"]
  CURRENCIES = ['$', '£', '€']

  validates :currency, :location, :description, :title, :category, :price, :seats, :host, presence: true
  validates_length_of :description, :maximum => 500, :allow_blank => false
  validates_numericality_of :seats, :price, :greater_than_or_equal_to =>0
  validate :not_past_date
  validate :valid_currency
  validates :seats, numericality: { :greater_than_or_equal_to => :seats_available}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/jfif"]

  def valid_currency
    if not CURRENCIES.include? self.currency
      errors.add(:date, 'Currencies available are: ' + CURRENCIES.join(","))
    end
  end

  def not_past_date
    if self.date.past?
      errors.add(:date, 'Dinner can not be hosted in the past')
    end
  end

  def self.remove_old
    # FIXME: users do not see old supprs, so they should not be able to interfer
    # with this command
    now = Time.now
    Dinner.where("date < ?", now).destroy_all
  end
end

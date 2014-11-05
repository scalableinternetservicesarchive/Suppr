class User < ActiveRecord::Base
  has_many :reservations
  has_many :dinners, :through => :reservations

  devise :database_authenticatable, :registerable,
  # :confirmable, #Add this for email confirmation
  :recoverable, :rememberable, :trackable, :validatable
end

def only_if_unconfirmed
  pending_any_confirmation {yield}
end
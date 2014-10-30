class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  # :confirmable, #Add this for email confirmation
  :recoverable, :rememberable, :trackable, :validatable
end

def only_if_unconfirmed
  pending_any_confirmation {yield}
end

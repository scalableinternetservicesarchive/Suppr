class User < ActiveRecord::Base
  has_many :reservations
  has_many :dinners, :through => :reservations

  devise :database_authenticatable, :registerable,
  # :confirmable, #Add this for email confirmation
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]
  validates :first_name, :email, # :last_name,
  presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      puts auth.info.name
      user.first_name = auth.info.name
      # DB workaround
      user.last_name = ' '
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end

def only_if_unconfirmed
  pending_any_confirmation {yield}
end

 class User < ActiveRecord::Base
   has_many :reservations
   has_many :dinners, :through => :reservations
   has_many :comments
   has_attached_file :image,
   :styles => {
     :medium => "300x300>",
     :small => "200x200>",
     :thumb => "100x100>"
   },
   :default_url => ":style/johndoe.jpg"

   validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/jfif"]

   devise :database_authenticatable, :registerable,
   # :confirmable, #Add this for email confirmation
   :recoverable, :rememberable, :trackable, :validatable,
   :omniauthable, :omniauth_providers => [:facebook]

   validates :first_name, :email, # :last_name,
   presence: true

  validates_numericality_of :n_joined, :n_hosted, :greater_than_or_equal_to =>0

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.first_name = auth.info.first_name
       user.last_name = auth.info.last_time

       # FB workaround
       user.last_name = user.last_name == nil ? ' ' : user.last_name

       if auth.info.image.present?
         avatar_url = process_uri(auth.info.image)
         user.update_attribute(:image, URI.parse(avatar_url))
       end
     end
   end

   def self.new_with_session(params, session)
     super.tap do |user|
       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
         user.email = data["email"] if user.email.blank?
       end
     end
   end

   # def self.process_uri(uri)
   #   avatar_url = URI.parse(uri)
   #   avatar_url.scheme = 'https'
   #   avatar_url.to_s
   # end
   private
   def self.process_uri(uri)
     require 'open-uri'
     require 'open_uri_redirections'
     open(uri, :allow_redirections => :safe) do |r|
       r.base_uri.to_s
     end
   end

 end

def only_if_unconfirmed
  pending_any_confirmation {yield}
end

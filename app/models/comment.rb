class Comment < ActiveRecord::Base
  belongs_to :dinner
  belongs_to :user
  validates :content, :user_id, :dinner_id, presence: true
end

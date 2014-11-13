class Comment < ActiveRecord::Base
  belongs_to :dinner
  validates :content, :user_id, :dinner_id, presence: true
end

class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :dinner
  validate :not_same_night

  def not_same_night
    if Reservation.exists? :yday => self.date.yday, :user_id => self.user.id
      errors.add(:date, 'You already joined a Suppr in the same day')
    end
  end

end

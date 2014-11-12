class AddConvenientYdayToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :yday, :integer
  end
end

class AddOptimisticLockReservations < ActiveRecord::Migration
  def self.up
      add_column :reservations, :lock_version, :integer
   end

   def self.down
      remove_column :reservations, :lock_version
   end
end

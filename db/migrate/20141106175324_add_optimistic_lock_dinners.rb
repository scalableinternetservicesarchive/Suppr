class AddOptimisticLockDinners < ActiveRecord::Migration
  def self.up
    add_column :dinners, :lock_version, :integer
  end
  
  def self.down
    remove_column :dinners, :lock_version
  end
end

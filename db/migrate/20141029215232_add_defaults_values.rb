class AddDefaultsValues < ActiveRecord::Migration
  def up
    change_column :dinners, :price, :float, :default => 0.00
    change_column :dinners, :seats_available, :Integer, :default => 0
    change_column :dinners, :seats, :Integer, :default => 0
  end

  def down
    change_column :dinners, :price, :float, :default => nil
    change_column :dinners, :seats_available, :Integer, :default => nil
    change_column :dinners, :seats, :Integer, :default => nil
  end
end

class AddInfoMapDinner < ActiveRecord::Migration
  def change
    add_column :dinners, :longitude, :float, :default => 0
    add_column :dinners, :latitude, :float, :default => 0
  end
end

class RemovePhotoFromDinners < ActiveRecord::Migration
  def change
  	remove_column :dinners, :photo
  end
end

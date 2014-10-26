class ChangeDescriptionFormatInDinners < ActiveRecord::Migration
  def up
  	change_column :dinners, :description, :text
  end
  def down
  	change_column :dinners, :description, :string
  end
end

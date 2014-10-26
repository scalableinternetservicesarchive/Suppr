class CreateDinners < ActiveRecord::Migration
  def change
    create_table :dinners do |t|
      t.timestamp :date
      t.string :location
      t.string :title
      t.string :description
      t.string :category
      t.float :price
      t.integer :seats_available
      t.timestamp :stamp

      t.timestamps
    end
  end
end

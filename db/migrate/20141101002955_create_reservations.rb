class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :dinner, index: true
      t.timestamp :date

      t.timestamps
    end
  end
end

class AddSeatsToDinner < ActiveRecord::Migration
  def change
    add_column :dinners, :seats, :Integer
  end
end

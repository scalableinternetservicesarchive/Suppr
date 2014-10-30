class AddUserToDinner < ActiveRecord::Migration
  def change
    add_reference :dinners, :user, index: true
  end
end

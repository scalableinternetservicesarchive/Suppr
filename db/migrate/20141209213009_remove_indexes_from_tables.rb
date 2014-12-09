class RemoveIndexesFromTables < ActiveRecord::Migration
  def change
    remove_index :reservations, column: :dinner_id
    remove_index :reservations, column: :user_id
    remove_index :users, column: :confirmation_token
    remove_index :users, column: :email
    remove_index :users, column: :reset_password_token
    remove_index :dinners, column: :host_id    
    remove_index :comments, column: :dinner_id    
    remove_index :comments, column: :user_id    
  end
end

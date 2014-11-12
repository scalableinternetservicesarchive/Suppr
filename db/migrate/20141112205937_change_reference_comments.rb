class ChangeReferenceComments < ActiveRecord::Migration
  def change
    remove_index :comments, :user_id
  end
end

class RemoveIndexComments < ActiveRecord::Migration
  def change
    remove_index :comments, :name => "index_comments_on_user_id"
  end
end

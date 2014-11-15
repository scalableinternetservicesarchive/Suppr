class AddHostedAndJoinedToUser < ActiveRecord::Migration
  def change
    add_column :users, :n_joined, :integer, :default => 0
    add_column :users, :n_hosted, :integer, :default => 0
  end
end

class ChangeReferencesNameFromUserToHostToDinner < ActiveRecord::Migration
  def change
    rename_column :dinners, :user_id, :host_id
  end
end

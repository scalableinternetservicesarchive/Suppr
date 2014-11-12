class AddAttachmentImageToDinners < ActiveRecord::Migration
  def self.up
    change_table :dinners do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dinners, :image
  end
end

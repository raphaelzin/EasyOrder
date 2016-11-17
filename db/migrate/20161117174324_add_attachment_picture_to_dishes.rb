class AddAttachmentPictureToDishes < ActiveRecord::Migration
  def self.up
    change_table :dishes do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :dishes, :picture
  end
end

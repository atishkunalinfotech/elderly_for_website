class AddAttachmentPhotoToElderGallaries < ActiveRecord::Migration
  def self.up
    change_table :elder_gallaries do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :elder_gallaries, :photo
  end
end

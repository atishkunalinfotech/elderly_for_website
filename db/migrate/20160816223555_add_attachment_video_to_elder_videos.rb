class AddAttachmentVideoToElderVideos < ActiveRecord::Migration
  def self.up
    change_table :elder_videos do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :elder_videos, :video
  end
end

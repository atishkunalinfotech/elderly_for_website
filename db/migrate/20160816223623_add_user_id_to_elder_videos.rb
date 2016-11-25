class AddUserIdToElderVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :elder_videos, :user_id, :integer
  end
end

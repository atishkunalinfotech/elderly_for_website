class AddElderVideoIdToElderShares < ActiveRecord::Migration[5.0]
  def change
    add_column :elder_shares, :elder_video_id, :integer
  end
end

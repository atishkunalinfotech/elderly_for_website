class CreateElderVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :elder_videos do |t|
      t.string :name

      t.timestamps
    end
  end
end

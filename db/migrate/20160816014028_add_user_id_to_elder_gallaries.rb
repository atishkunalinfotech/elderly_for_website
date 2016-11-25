class AddUserIdToElderGallaries < ActiveRecord::Migration[5.0]
  def change
    add_column :elder_gallaries, :user_id, :integer
  end
end

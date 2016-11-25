class CreateElderShares < ActiveRecord::Migration[5.0]
  def change
    create_table :elder_shares do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :elder_gallary_id

      t.timestamps
    end
  end
end

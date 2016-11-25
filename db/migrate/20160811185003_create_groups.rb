class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :user_id
      t.boolean :manager, :default=>false

      t.timestamps
    end
  end
end

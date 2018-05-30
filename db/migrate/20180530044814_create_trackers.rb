class CreateTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :trackers do |t|
      t.string :uuid, null: false
      t.string :recipient
      t.string :notes
      t.integer :view_count, default: 0
      t.timestamp :last_viewed

      t.timestamps
    end

    add_index :trackers, :uuid
  end
end

class CreateTweepsters < ActiveRecord::Migration
  def change
    create_table :tweepsters do |t|
      t.string :username
      t.integer :twitter_id, limit: 8
      t.integer :cursor, limit: 8, null: false, default: -1

      t.timestamps
    end
  end
end

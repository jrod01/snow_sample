class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :twitter_id, limit: 8
      t.integer :tweepster_id, limit: 8

      t.timestamps
    end
  end
end

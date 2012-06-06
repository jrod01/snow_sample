class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :twitter_id, limit: 8
      t.integer :tweepster_id, limit: 8
    end

    add_index :followers, [:twitter_id, :tweepster_id], :unique => true
  end
end

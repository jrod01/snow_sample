class CreateTweepsters < ActiveRecord::Migration
  def change
    create_table :tweepsters do |t|
      t.string :username
      t.string :twitter_id

      t.timestamps
    end
  end
end

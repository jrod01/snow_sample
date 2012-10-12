class CreateVotingAdvices < ActiveRecord::Migration
  def change
    create_table :voting_advices do |t|
      t.string :to
      t.text :content
      t.datetime :sent_at

      t.timestamps
    end
  end
end

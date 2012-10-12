class AddTwitterUserIdToVotingAdvice < ActiveRecord::Migration
  def change
    add_column :voting_advices, :twitter_id, :integer
  end
end

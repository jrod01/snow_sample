class Follower < ActiveRecord::Base
  attr_accessible :tweepster_id, :twitter_id

  belongs_to :tweepster
end

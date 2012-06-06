class Follower < ActiveRecord::Base
  attr_accessible :tweepster_id, :twitter_id

  validates_uniqueness_of :twitter_id, scope: :tweepster_id

  belongs_to :tweepster
end

# app/models/voting_advice.rb
class VotingAdvice < ActiveRecord::Base
  attr_accessible :text, :sent_at, :twitter_user_id
  # not sure if you need this any more... attr_accessible :to
  def post!
    Twitter.post!(twitter_user_id, text)
    update_attribute :sent_at, Time.now
  rescue TwitterException
    # log
  end
end

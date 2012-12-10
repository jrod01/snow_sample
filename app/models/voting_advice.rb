class VotingAdvice < ActiveRecord::Base
  attr_accessible :text, :sent_at, :twitter_id
  # not sure if I need this any more... attr_accessible :to
  def post!
    Twitter.post!(twitter_id, "You vote here <url, etc>")
    update_attribute :sent_at, Time.now
  rescue TwitterException 
    # log
  end
end

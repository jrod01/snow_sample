class Tweepster < ActiveRecord::Base
  attr_accessible :twitter_id, :username

  has_many :followers

  def follower_count
  	Twitter.user(username).followers_count
  end

  def save_followers
    if cursor.nonzero?
      fids = Twitter.follower_ids(username, cursor: cursor)
      followers.create(fids.ids.map{ |tid| { twitter_id: tid } })
    end
  end
end

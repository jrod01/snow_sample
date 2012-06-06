class Tweepster < ActiveRecord::Base
  attr_accessible :twitter_id, :username

  has_many :followers

  def follower_count
  	Twitter.user(username).followers_count
  end

  def save_followers
    if cursor.nonzero?
      fids = Twitter.follower_ids(username, cursor: cursor)
      id_list = (fids.ids - follower_ids).map{ |tid| "(#{id}, #{tid}" }
      # followers.create(fids.ids.map{ |tid| { twitter_id: tid } })
      Follower.connection.execute("INSERT INTO followers (tweepster_id, twitter_id) VALUES #{id_list.join(',')}")
    end
  end
end

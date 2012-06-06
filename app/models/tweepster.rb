class Tweepster < ActiveRecord::Base
  attr_accessible :twitter_id, :username

  has_many :followers

  def follower_count
  	Twitter.user(username).followers_count
  end

  def save_followers
    if cursor.nonzero?
      fids = Twitter.follower_ids(username, cursor: cursor)
      id_list = fids.ids - followers.map(&:twitter_id)
      sql_pairs = id_list.map{ |tid| "(#{tid}, #{id})" }

      sql_pairs.in_groups_of(500, false) do |id_pairs|
        Follower.connection.execute("INSERT INTO followers (twitter_id, tweepster_id) VALUES #{id_pairs.join(',')}")
      end

      update_attribute(:cursor, fids.next_cursor)
    end
  end
end

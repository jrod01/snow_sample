class Tweepster < ActiveRecord::Base
  attr_accessible :twitter_id, :username

  has_many :followers

  def follower_count
  	Twitter.user(username).followers_count
  end

  def save_followers
    # Check to see if we have made it through all the pages of followers yet:
    if cursor.nonzero?
      # Get the next 5k followers:
      fids = Twitter.follower_ids(username, cursor: cursor)

      # Pair up the new ids with this tweepster's database id. The pair is what is inserted to the db:
      sql_pairs = fids.ids.map{ |fid| "(#{fid}, #{id})" }

      # Break into groups of 500 at a time, and do 10 big honking bulk insert to cover all 5k ids:
      sql_pairs.in_groups_of(500, false) do |id_pairs|
        # the INGORE option to the INSERT sql command is MySQL only, and silences dup-key errors:
        Follower.connection.execute("INSERT IGNORE INTO followers (twitter_id, tweepster_id) VALUES #{id_pairs.join(',')}")
      end

      # Remember the page we are on, so we can resume on the next request:
      update_attribute(:cursor, fids.next_cursor)
    end
  end
end

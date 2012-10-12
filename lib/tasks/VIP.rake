desc "Send info to random user for voting info"
task :search => :environment do 
  [
    'Voting Info',
    'Polling Place',
    'voting precinct',
    'where do I vote?'
  ].each do |query|
    Twitter.search(query, :result_type => 'recent').results.each do |status|
      voting_advice = VotingAdvice.create!(:twitter_user_id => status.user.id, :text => "you vote here")
      voting_advice.post!
    end
  end
end

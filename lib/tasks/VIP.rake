 desc "Send info to random user for voting info"
task :search => :environment do 
  [
    'Voting Info',
    'Polling Place',
    'voting precinct',
    'where do I vote?'
  ].each do |query|
    Twitter.search(query, :result_type => 'recent').results.each do |status|
      voting_advice = VotingAdvice.create!(:twitter_id => status.user.id)
      voting_advice.post!
    end
  end
end
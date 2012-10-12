desc "Send info to random user for voting info"
task :search => :environment do 

  response = ResponseObject.new

  Twitter.search("Voting Info",:result_type => "recent").results.map do |status|
    puts "#{status.from_user}: #{status.text}: #{status.geo}: #{status.user.id}"
    
    response.to = status.from_user
    response.text = "you vote here"
  end
  
  Twitter.search("Polling Place",:result_type => "recent").results.map do |status|
    puts "#{status.from_user}: #{status.text}: #{status.geo}: #{status.user.id}"

    response.to = status.from_user
    response.text = "you vote here"
  end

  Twitter.search("voting precint",:result_type => "recent").results.map do |status|
    puts "#{status.from_user}: #{status.text}: #{status.geo}: #{status.user.id}"
    
    response.to = status.from_user
    response.text = "you vote here"
  end

  Twitter.search("where do i vote?",:result_type => "recent").results.map do |status|
    puts "#{status.from_user}: #{status.text}: #{status.geo}: #{status.user.id}"

    response.to = status.from_user
    response.text = "you vote here"
  end
  
  begin
    Twitter.send!(response) # send the tweet or "post" tweet

    response.sent = true
    response.save!
  rescue TwitterException => twitter_exception
    # log the error  
  end
end


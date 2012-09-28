desc "Send info to random user for voting info"
task :search => :environment do 
  Twitter.search("Voting Info",:result_type => "recent").results.map do |status|
    puts "#{status.from_user}: #{status.text}"
  end
  Twitter.coordinates("32.60904,-116.66297000000002:25.866360000000004,-98.38172:25.390900000000002,-81.50672:44.26661000000001,-66.74109:47.685520000000004,
    -69.02625:49.31597000000001,-97.15125:48.855470000000004,-127.38562000000002:37.91579,-129.14344",:result_type =>"recent").results.map do |status|
    puts " #{status.from_user}: #{status.text}"
  end
end
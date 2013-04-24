require './GenFeed'

loop do
  mac_feed = GenFeed.new
  mac_feed.uri = "http://developer.apple.com/library/mac/navigation/library.json"
  mac_feed.os = "Mac"
  mac_okay = mac_feed.run

  ios_feed = GenFeed.new
  ios_feed.uri = "http://developer.apple.com/library/ios/navigation/library.json"
  ios_feed.os = "iOS"
  ios_okay = ios_feed.run

  if mac_okay && ios_okay
    sleep 900 # wait 15m and check for more updates
  else
    sleep 60 # wait 1m and try again
  end
end

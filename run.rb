require './GenFeed'

mac_feed = GenFeed.new
mac_feed.uri = "http://developer.apple.com/library/mac/navigation/library.json"
mac_feed.os = "Mac"

ios_feed = GenFeed.new
ios_feed.uri = "http://developer.apple.com/library/ios/navigation/library.json"
ios_feed.os = "iOS"

loop do
  if mac_feed.run && ios_feed.run
    sleep 900 # wait 15m and check for more updates
  else
    sleep 60 # wait 1m and try again
  end
end

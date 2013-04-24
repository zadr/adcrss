Unofficial ADC Library RSS Feeds
================================

Unofficial RSS feeds for the [Mac Developer Library](http://developer.apple.com/library/mac) and [iOS Developer Library](http://developer.apple.com/library/ios) Apple.

The Feeds:
---------
They're updated every 15 minutes, which is probably a bit much given Apple doesn't update their content nearly that often.

- iOS Developer Library Feed: [Here](http://thisismyinter.net/adcrss/iOS.xml)
- Mac Developer Library Feed: [Here](http://thisismyinter.net/adcrss/Mac.xml)

Running Your Own Set of Feeds:
---------------------
- Install the [Daemonize](http://daemons.rubyforge.org) gem, as well as the [JSON](http://rubygems.org/gems/json) gem.
- Change the path the XML is written to for your web server.
- Execute: `ruby daemon.rb start`


Other Thoughts:
---------------
Its the product of about an hour and a half when I needed a break from writing ObjC. If you don't like anything about it, well, let me know, I guess. Either file a ticket, or, let me know on twitter -- I'm [@zadr](http://twitter.com/zadr)

Disclaimer:
-----------
Unofficial. I have nothing to do with Apple whatsoever. All content that the feed links to is theirs.

I wanted to be able to keep track of it better, so, I made this little thing. But the actual content is not mine.

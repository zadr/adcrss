# Standard library
require 'net/http'
require 'digest'
require 'rss'

# from Rubygems
require 'rubygems'
require 'json'

class GenFeed
  def uri=(uri)
    @uri = URI.parse(uri)
    @http = Net::HTTP.new(@uri.host, @uri.port)
  end

  def os=(os)
    @os = os
  end

  def run
    @old_data_hash = ""
    request = Net::HTTP::Get.new(@uri.request_uri)
    response = @http.request(request)

    if response.kind_of? Net::HTTPSuccess
      new_data_hash = Digest::MD5.hexdigest(response.body)
    
      if (new_data_hash != @old_data_hash)
        @old_data_hash = new_data_hash

        feed_data = JSON.parse(response.body)
        name_index = feed_data["columns"]["name"]
        update_size_index = feed_data["columns"]["updateSize"]
        url_index = feed_data["columns"]["url"]
        display_date_index = feed_data["columns"]["displayDate"]

        rss = RSS::Maker.make("atom") do | maker |
          maker.channel.author = @os + " Developer Library"
          maker.channel.title = maker.channel.author
          maker.channel.updated = Time.now.to_s
          maker.channel.about = @uri.host

          feed_data["documents"].each do | document |
            maker.items.new_item  do | item |
              item.link = "http://developer.apple.com/library/ios/navigation/" + document[url_index]
              item.title = document[name_index]
              item.updated = document[display_date_index]
            end
          end
        end

        File.open("../webapps/htdocs/adcrss/" + @os + ".xml", 'w') do | file |
          file.write(rss)
        end
      end

      return true
    else
      return false
    end
  end
end

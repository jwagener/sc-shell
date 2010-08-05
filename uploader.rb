#!/usr/bin/env ruby
require 'soundcloud-authorized'
oauth_consumer = {
  :host => 'soundcloud.com',
  :consumer_token_key => 'G3V06sE9Jk1tKdSHZ8XrQ',
  :consumer_token_secret => 'neiEU8i4vL0FCrRVko09kYE8LuiLMXEepQuRd2I',
}

settings_file = ARGV.shift
puts "loading settings from #{settings_file}"
settings = eval(File.new(settings_file).read)


oauth_settings = settings[:oauth].merge(oauth_consumer)
SC = soundcloud_authorize(oauth_settings)



#puts "Uploading track..." # File upload doesn't want to work.  Trying to pass a file around ANYWHERE with ruby next.
#track = soundcloud.Track.create(
#  :title      => "Uploaded With The SoundCloud API",
#  :asset_data => File.new(path_to_audio_file))
#  
#puts "New track '#{track.title}' is now available at #{track.permalink_url}"
#



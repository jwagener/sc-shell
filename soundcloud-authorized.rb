require 'rubygems'
gem 'soundcloud-ruby-api-wrapper'
require 'soundcloud'

def soundcloud_authorize(settings={})
  @consumer = OAuth::Consumer.new(settings[:consumer_token_key], settings[:consumer_token_secret], {
    :site               => "http://api.#{settings[:host]}", 
    :request_token_path => '/oauth/request_token',
    :access_token_path  => '/oauth/access_token',
    :authorize_path     => '/oauth/authorize'
  })
  @authorize_url = "http://#{settings[:host]}/oauth/authorize?oauth_token="
  
  access_token = if settings[:access_token_key].blank? || settings[:access_token_secret].blank?
    puts "Get request token"
    request_token = @consumer.get_request_token
    
    url = @authorize_url + request_token.token
    puts "Open this URL:"
    puts "#{url}"
    `open #{url}`
    
    puts "Enter the 6 digit authorization code:"
    oauth_verifier = gets.chomp
    
    access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)
    puts "To store this access token you can put this into your project settings file:"
    puts ":access_token_key     => '#{access_token.token}',"
    puts ":access_token_secret  => '#{access_token.secret}',"
    access_token
  else
    puts "Using existing access_token"
    OAuth::AccessToken.new(@consumer, settings[:access_token_key], settings[:access_token_secret])
  end

  soundcloud = Soundcloud.register({:access_token => access_token, :site => @consumer.site})
  me = soundcloud.User.find_me

  puts "Authorized and connected to SoundCloud as #{me.username}!"
end
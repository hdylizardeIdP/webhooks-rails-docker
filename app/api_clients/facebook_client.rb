require 'koala'
require 'dotenv'

class FacebookClient
  def initialize
    @graph = Koala::Facebook::API.new(access_token)
  end

  # memoized method to get the access token
  def access_token
    @access_token ||= Koala::Facebook::OAuth.new(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']).get_app_access_token
  end

#   def access_token
#     app_id = ENV['FACEBOOK_APP_ID']
#     app_secret = ENV['FACEBOOK_APP_SECRET']
#     Koala::Facebook::OAuth.new(app_id, app_secret).get_app_access_token
#   end

  def get_profile
    @graph.get_object('me')
  end

  #memoized method to get my profile and print it out
  def print_my_profile
    puts "Hello, #{get_profile['name']}!"
  end

end

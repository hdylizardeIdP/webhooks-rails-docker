require 'net/http'
require 'json'
require 'uri'
require 'openssl'

# create an instance of the OAuth client that connects to the OAuth provider to get an access token
class OauthClient
    OAUTH2_URI = "https://oauth2.googleapis.com/token"
    CLIENT_ID = ENV["GOOGLE_CLIENT_ID"]
    CLIENT_SECRET = ENV["GOOGLE_CLIENT_SECRET"]

# get an access token from the OAuth provider
    def get_access_token
        uri = URI.parse(OAUTH2_URI)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(uri.request_uri)
        request.content_type = "application/x-www-form-urlencoded"
        request.set_form_data(
            "client_id" => CLIENT_ID,
            "client"    => CLIENT_SECRET)

    end

# memoized method to get the access token

end

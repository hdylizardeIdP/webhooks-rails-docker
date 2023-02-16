require 'net/http'
require 'json'
require 'uri'
require 'openssl'

# create an instance of the OAuth client that connects to the OAuth provider to get an access token
class OauthClient
    # setup 2 constants for the OAuth provider's URI and the client ID and secret, to differentiate between staging and production
    OAUTH2_URI = "https://oauth2.googleapis.com/token"
    CLIENT_ID = ENV["GOOGLE_CLIENT_ID"]
    CLIENT_SECRET = ENV["GOOGLE_CLIENT_SECRET"]

# method to return different OAUTH2_URI values depending on whether we're in staging environment or production
def oauth2_uri
    if Rails.env.production?
        "https://oauth2.googleapis.com/token"
    else
        "https://oauth2.googleapis.com/token"
    end

end

# method to return different CLIENT_ID values depending on whether we're in staging environment or production
def client_id

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

# get the user's email address from the OAuth provider
    def get_user_email(access_token)
        uri = URI.parse("https://www.googleapis.com/oauth2/v2/userinfo")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri.request_uri)
        request
    end


end

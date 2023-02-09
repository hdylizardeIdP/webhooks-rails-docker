require 'rails_helper'

RSpec.describe OauthClient do

    before do
        stub_request
    end

    it "should return a 201 status code" do
        oauth2_response = oauth_client.get_access_token
    end
    # create a new instance of the OauthClient class and test its methods
    def oauth_client
        OauthClient.new
    end

    # using webmock/rspec, stub the request to the OAuth provider and return a 201 status code
    def stub_request
        stub_request(:post, "https://oauth2.googleapis.com/token").
            with(
                body: {"client_id" => "1234567890", "client" => "0987654321"},
                headers: {
                    'Accept'=>'*/*',
                    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                    'Content-Type'=>'application/x-www-form-urlencoded',
                    'User-Agent'=>'Ruby'
                }).
            to_return(status: 201, body: "", headers: {})
    end
end
require 'rails_helper'

RSpec.describe OauthClient do

    # create a new instance of the OauthClient class and test its methods
    def oauth_client
        OauthClient.new
    end

    # using webmock/rspec, stub the request to the OAuth provider and return a 201 status
    def mock_status 
end
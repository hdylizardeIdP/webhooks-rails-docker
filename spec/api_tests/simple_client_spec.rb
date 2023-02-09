require 'rails_helper'
require 'webmock/rspec'

# create a new instance of the SimpleClient class and test its methods
RSpec.describe SimpleClient do
    before do
        stub_request(:any, "https://api.github.com/users/learn-co-students")
            .to_return(status: 200, body: {
            }.to_json
        )
    end

  it "should return a 200 status code" do
    simple_client_response = simple_client.get_user
    expect(simple_client.status_code).to eq("200")

  end

  def simple_client
    SimpleClient.new
  end

  # using webmock/rspec, stub out the request to the GitHub API and return a 200 status code
    # def stub_request
    #     stub_request(:get, "https://api.github.com/users/learn-co-students").
    #         with(
    #             headers: {
    #                 'Accept'=>'*/*',
    #                 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #             }
    # end

    

Net::HTTP.get("www.example.com", "/")    # ===> Success

end
require 'rails_helper'
# generate a new spec file to test the facebook_client.rb file
RSpec.describe FacebookClient do
  # create a new instance of the FacebookClient class
  let!(:facebook_client) { FacebookClient.new }
  # test the get_profile method
  describe '#get_profile' do
    # test that it has an access token
    it 'has an access token' do
      expect(facebook_client.access_token).to be_a(String)
      puts facebook_client.access_token
    end
    # test that the method returns a hash
    it 'returns a hash' do
      expect(facebook_client.get_profile).to be_a(Hash)
    end
    # test that the hash contains the key 'name'
    # it 'returns a hash containing the key "name"' do
    #   expect(facebook_client.get_profile).to have_key('name')
    # end
  end
end
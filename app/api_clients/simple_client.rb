require 'net/http'
require 'json'
require 'uri'
require 'openssl'
require 'dotenv'

class SimpleClient
  def initialize
    @uri = URI.parse("https://api.github.com/users/learn-co-students")
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  def get_user
    request = Net::HTTP::Get.new(@uri.request_uri)
    request["Authorization"] = "token" + ENV["GITHUB_TOKEN"]
    response = @http.request(request)
    JSON.parse(response.body)
  end

  #memoized method to get the user using instance variables @request and @response
  def user  
    @request ||= Net::HTTP::Get.new(@uri.request_uri)
    @request["Authorization"] = "token" + ENV["GITHUB_TOKEN"]
    @response ||= @http.request(@request)
    @user ||= JSON.parse(@response.body)

  end

  # memoized method to get the status code of the response
    def status_code
      @request ||= Net::HTTP::Get.new(@uri.request_uri)
      @request["Authorization"] = "token" + ENV["GITHUB_TOKEN"]
      @response ||= @http.request(@request)
      @status_code ||= @response.code
    end

    # memoized method to get the status message of the response
    def status_message
      @request ||= Net::HTTP::Get.new(@uri.request_uri)
      @request["Authorization"] = "token" + ENV["GITHUB_TOKEN"]
      @response ||= @http.request(@request)
      @status_message ||= @response.message
    end

    # memoized method to get the response headers
    def response_headers
      @request ||= Net::HTTP::Get.new(@uri.request_uri)
      @request["Authorization"] = "token" + ENV["GITHUB_TOKEN"]
      @response ||= @http.request(@request)
      @response_headers ||= @response.to_hash
    end

end
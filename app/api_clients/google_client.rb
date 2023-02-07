require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'google/apis/calendar_v3'

# Initialize the client
calendar = Google::Apis::CalendarV3::CalendarService.new
calendar.client_options.application_name = 'Calendar API Ruby Quickstart'
calendar.authorization = authorize

# Read the stored credentials from the file
OAUTH_CREDENTIALS_PATH = 'credentials.json'
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

def authorize
  client_id = Google::Auth::ClientId.from_file(OAUTH_CREDENTIALS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: 'token.yaml')
  authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: OOB_URI)
    puts 'Open the following URL in the browser and enter the ' \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end

# Make a subsequent API request
calendar_id = 'primary'
results = calendar.list_events(calendar_id,
                                max_results: 10,
                                single_events: true,
                                order_by: 'startTime',
                                time_min: Time.now.iso8601)
puts 'Upcoming events:'
puts 'No upcoming events found' if results.items.empty?
results.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
end

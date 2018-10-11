# require 'yelp'
#
# module Adapter
#   class Yelp
#
#     def initialize
#       @client ||=
#         Octokit::Client.new({ consumer_key: YOUR_CONSUMER_KEY,
#                             consumer_secret: YOUR_CONSUMER_SECRET,
#                             token: YOUR_TOKEN,
#                             token_secret: YOUR_TOKEN_SECRET
#                           })
#     end
#
#     def repo_issues
#       @client.issues("#
#         {repo.user.github_username}/#
#         {repo.name}")
#     end
#
#     def create_repo_webhook
#       @client.create_hook("#
#         {repo.user.github_username}/#
#         {repo.name}",
#         'web',
#         {url: "#
#   {ENV['ISSUE_TRACKR_APP_URL']}/webhooks/receive",
#            content_type: 'json'},
#         {events: ['issues'], active: true})
#     end
#   end

require "json"
require "http"
require "optparse"

API_KEY = "WsnNTUNYbI9WZVvVcr_YCkEjuofNIlR80uCTnU1qDZ1N-NoWCJ2HYELVzxLOXxZPCmsvdMFxmnLZQ-NsShyL9t79lh7LkJD42JJ6W0X-7pIzxF6WbLf32JM1U_G8W3Yx"
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
SEARCH_LIMIT = 5

def search(term, location)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
  }

  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end

puts search("ramen", "nyc")

require "json"
require "http"
require "optparse"


API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
SEARCH_LIMIT = 1

def search(term, location)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
  }

  response = HTTP.auth("Bearer #{ENV['API_KEY']}").get(url, params: params)
  response.parse
end


puts search("dumpling", "nyc")

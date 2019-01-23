require "json"
require "http"
require "optparse"

  class YelpApi
    # attr_reader :api_key
    def initialize
      @api_host = "https://api.yelp.com"
      @search_path = "/v3/businesses/search"
    end

    def search(term, location, limit = 50, radius = 40000) #radius should be integer! no float! The integer shows meter.
      url = "#{@api_host}#{@search_path}"
      params = {
        term: term,
        location: location,
        categories: "ramen",
        limit: limit,
        radius: radius
      }

      response = HTTP.auth("Bearer #{ENV['API_KEY']}").get(url, params: params) #data is string
      response.parse #data changed into ruby object. In search_controller, it will change into json data
    end
  end

class SearchesController < ApplicationController
  def businesses
    # byebug
    yelp = YelpApi.new
    limit = params[:limit] || 20 #set 5 as default
    radius = params[:radius] || 40000
    # results = yelp.search(params[:term], params[:location], limit)
    # puts results
    render json: yelp.search(params[:term], params[:location], limit, radius) #change ruby object into JSON string
  end
end

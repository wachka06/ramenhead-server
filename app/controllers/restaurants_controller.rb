class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  # GET /favorites
  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  # GET /favorites/1
  def show
    render json: @restaurant
  end

  # POST /favorites
  def create
    @restaurant = Restaurant.new({
        name: params[:restaurant][:name],
        image_url: params[:restaurant][:image_url],
        rating: params[:restaurant][:rating],
        price: params[:restaurant][:price],
        display_phone: params[:restaurant][:display_phone],
        display_address: params[:restaurant][:location][:display_address]*" ",
        longitude: params[:restaurant][:coordinates][:longitude],
        latitude: params[:restaurant][:coordinates][:latitude],
        api_id: params[:restaurant][:id]
      })

    if @restaurant.save
      render json: @restaurant, status: :created, location: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorites/1
  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def destroy
    @restaurant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.


    def favorite_params  ###because of the security reason, we pass attributes as strong params. plus, if you save attributes as strong_params, they won't crush the data when they're saved in the database.
      params.require(:restaurant).permit(:name, :image_url, :rating, :price, :display_phone, :display_address, :longitude, :latitude, :api_id)
    end
end

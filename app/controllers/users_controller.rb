class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    @users = User.all

    render json: @users
  end

  # GET /reviews/1
  def show
    render json: {
      name: @user.name,
      favorite_restaurants: @user.favorite_restaurants, #Show the restaurants user saved as "favorite."
      reviews: @user.reviews #Show the reviews user wrote so far.
    }
  end

  # POST /reviews
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @user.destroy
  end

  def add_favorite_restaurant #send the data from the frontend to the backend, create instance and save it in the backend
      # byebug
    if Restaurant.find_by(api_id: params['restaurant'][:id])
      @restaurant = Restaurant.find_by(api_id: params['restaurant'][:id])
    else
      # byebug
      @restaurant = Restaurant.create({
          name: params[:restaurant][:name],
          image_url: params[:restaurant][:image_url],
          rating: params[:restaurant][:rating],
          price: params[:restaurant][:price],
          display_phone: params[:restaurant][:display_phone],
          display_address: params[:restaurant][:display_address],
          longitude: params[:restaurant][:longitude],
          latitude: params[:restaurant][:latitude],
          api_id: params[:restaurant][:api_id]
        })
    end
       #API key is unique   {restaurant: {...ramenObj}, user_id: 1} => params
    @favorite = Favorite.find_by(user_id: params[:user_id], restaurant_id: @restaurant.id)

    if !@favorite #if this favorite instance doesn't exist...
      # @restaurant = Restaurant.create(params['restaurant'])
      @favorite = Favorite.create(user_id: params[:user_id], restaurant_id: @restaurant.id)
      # byebug
      render json: { message: 'succesfully created'}
    else
      @favorite.destroy
      render json: { message: 'succesfully destroyed' }
    end

    # if condition
    #   render json: { message: 'succesfully created'}
    # else
    #   render json: { message: 'succesfully destroyed' }
    # end
    # @favorite = Favorite.find_by(user_id: 1, restaurant_id: 2)

  end
  #
  # def add_review
  #
  # end

  def get_favorites #send the saved data from the backend to the frontend
    # byebug
    @user = User.find(params[:id])
    @favorite = @user.favorites # Currently, @favorite just stay in backend
    # render json: "Isho Boiii"
    render json: @favorite # @favorite need to be changed into json script and to be sent to the frontend(render...shows to the json).
    # at 'http://localhost:3000/restaurants', you can see the data which is rendered.
    # byebug
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:user).require(:name, :email)
    end
end

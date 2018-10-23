class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: {
      name: @user.name,
      favorite_restaurants: @user.favorite_restaurants, #Show the restaurants user saved as "favorite."
      reviews: @user.reviews #Show the reviews user wrote so far.
    }
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
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
          display_address: params[:restaurant][:location][:display_address]*" ",
          longitude: params[:restaurant][:coordinates][:longitude],
          latitude: params[:restaurant][:coordinates][:latitude],
          api_id: params[:restaurant][:id]
        })
    end
    # byebug
       #API key is unique   {restaurant: {...ramenObj}, user_id: 1} => params
    @favorite = Favorite.find_by(user_id: params[:user_id], restaurant_id: @restaurant.id)

    if !@favorite #if this favorite instance doesn't exist...

      @favorite = Favorite.create(user_id: params[:user_id], restaurant_id: @restaurant.id)
      # byebug
      render json: { message: 'succesfully created'} # this message will be sent to the frontend
    else
      @favorite.destroy
      render json: { message: 'succesfully destroyed' } # if @favorite already exists, @favorite row will be deleted from the database. (unfavorite)
    end
  end

  def get_favorites #send the saved data from the backend to the frontend
    # byebug
    @user = User.find(params[:id]) #find take integer as the parameter
    @favorite = @user.favorites # Currently, @favorite just stay in backend
    # check 'http://localhost:3000/1/get_favorites' if the favorite restaurant is saved in the user's show page.
    # render json: "Isho Boiii"
    render json: @favorite # @favorite need to be changed into json script and to be sent to the frontend(render...shows to the json).
    # at 'http://localhost:3000/favorites', you can see the data which is rendered.
    # byebug
  end

  # def add_review
  #
  # end

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

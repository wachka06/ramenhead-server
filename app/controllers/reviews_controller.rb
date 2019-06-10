class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    # byebug
    if Restaurant.find_by(api_id: params[:review][:api_id])
      @restaurant = Restaurant.find_by(api_id: params[:review][:api_id])
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

    @review = Review.create(rating: params[:review][:rating],
      contents: params[:review][:contents],
      user_id: User.first.id,  # params[:review][:user_id]
      restaurant_id: @restaurant.id)
      # byebug
      render json: { message: 'succesfully created'} # this message will be sent to the frontend
  end

  def get_reviews
    # byebug
    @restaurant = Restaurant.find_by(api_id: params[:api_id])
    # print 'PARAMMMMMS' + params[:api_id]
    print "GGGGGGGGGG"
    print @restaurant
    # @reviews = Review.where(api_id: params[:api_id])
    if @restaurant.reviews
      render json: @restaurant.reviews
    end 
  end

  def get_user_reviews
    # byebug
    @user = User.find(params[:id]) #find take integer as the parameter
    @review = @user.reviews # Currently, @favorite just stay in backend
    # check 'http://localhost:3000/1/get_favorites' if the favorite restaurant is saved in the user's show page.
    # render json: "Isho Boiii"
    render json: @review # @favorite need to be changed into json script and to be sent to the frontend(render...shows to the json).
    # at 'http://localhost:3000/favorites', you can see the data which is rendered.
    # byebug
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:user_id, :api_id, :rating, :contents)
      params.require(:restaurant).permit(:name, :image_url, :rating, :price, :display_phone, :display_address, :longitude, :latitude, :api_id)
    end
end

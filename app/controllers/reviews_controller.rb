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
    byebug
    @restaurant = Restaurant.find_or_create_by(
      name: params[:restaurant][:name],
      image_url: params[:restaurant][:image_url],
      rating: params[:restaurant][:rating],
      price: params[:restaurant][:price],
      display_phone: params[:restaurant][:display_phone],
      display_address: params[:restaurant][:location][:display_address],
      longitude: params[:restaurant][:coordinates][:longitude],
      latitude: params[:restaurant][:coordinates][:latitude],
      api_id: params[:restaurant][:id]
    )

    @review = Review.new(
      rating: params[:review][:rating],
      contents: params[:review][:contents],
      user_id: User.first.id,  # params[:review][:user_id]
      restaurant_id: @restaurant.id
    )
    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
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
    end
end

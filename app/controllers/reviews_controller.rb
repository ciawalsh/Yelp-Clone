class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to restaurants_path
    if current_user.has_reviewed?(@restaurant)
      error message
    end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end

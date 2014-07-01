class ReviewsController < ApplicationController

  def create
    @category = Category.friendly.find(params[:category_id])
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(params.require(:review).permit!)
    @review.user = current_user

    if @review.save
      redirect_to [@category, @restaurant]
    else
      render '/restaurant'
    end
  end

end
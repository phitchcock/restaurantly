class RestaurantsController < ApplicationController

  before_action :set_category
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = @category.restaurants.build(restaurant_params)

    if @restaurant.save
      redirect_to [@category, @restaurant], notice: "#{@restaurant.name} was added"
    else
      flash[:error] = "Restaurant was not added please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to category_restaurants_path, notice: "#{@restaurant.name} was updated"
    else
      flash[:error] = "restaurant was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @restaurant.destroy
      redirect_to category_restaurants_path, notice: "restaurant was removed"
    else
      flash[:error] = "Restaurant was not removed please try again"
      redirect_to category_restaurants_path
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit!
  end

end
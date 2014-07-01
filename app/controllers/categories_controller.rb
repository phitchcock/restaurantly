class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.friendly.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: "#{@category.title} was created"
    else
      flash[:error] = "Catory was not saved, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category), notice: "#{@category.title} was updated"
    else
      flash[:error] = "Category was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to root_path, notice: "#{@category.title} was destroyed"
    else
      flash[:error] = "Category was not destroyed please try again"
      redirect_to category_path(@category)
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end

end
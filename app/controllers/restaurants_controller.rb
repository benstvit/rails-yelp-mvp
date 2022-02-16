class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all.sort { |a, b| b <=> a }
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(set_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant created!'
    else
      render :new
    end
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def set_restaurant
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

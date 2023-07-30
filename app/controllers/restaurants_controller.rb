class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:index, :show]

  def index
    if params[:dish_ids].present?
      selected_dishes = Dish.where(id: params[:dish_ids])
      @restaurants = Restaurant.joins(:dishes).where(dishes: { id: selected_dishes }).distinct
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviewable = @restaurant
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update_status
    @restaurant = Restaurant.find(params[:id])
    new_status = params[:restaurant][:status]

    if @restaurant.update(status: new_status)
      # Enqueue the StatusUpdateJob with a delay of 5 minutes (300 seconds)
      StatusUpdateJob.set(wait: 5.minutes).perform_later(@restaurant.id, new_status)

      redirect_to @restaurant, notice: 'Restaurant status was successfully updated.'
    else
      render 'show'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path, notice: 'Restaurant was successfully deleted.'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :status)
  end
end

class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:index, :show]

  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @reviewable = @dish # Set the @reviewable to the @dish
    @review = Review.new # Initialize a new review object for the form
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = @restaurant.dishes.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = @restaurant.dishes.build(dish_params)

    if @dish.save
      redirect_to restaurant_path(@restaurant), notice: 'Dish was successfully created.'
    else
      render 'new'
    end
  end


  def edit
    @dish = Dish.find(params[:id])
    @restaurant = @dish.restaurant # Find the associated restaurant for the dish
  end
  

  def update
    @dish = Dish.find(params[:id])

    if @dish.update(dish_params)
      redirect_to @dish, notice: 'Dish was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy

    redirect_to dishes_path, notice: 'Dish was successfully deleted.'
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :restaurant_id)
  end
end

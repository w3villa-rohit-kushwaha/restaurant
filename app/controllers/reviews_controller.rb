class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:create]


  def create
    @reviewable = find_reviewable
    @review = @reviewable.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      if @reviewable.is_a?(Restaurant)
        redirect_to restaurant_path(@reviewable), notice: 'Review was successfully created.'
      elsif @reviewable.is_a?(Dish)
        redirect_to dish_path(@reviewable), notice: 'Review was successfully created.'
      else
        # Handle other cases if necessary
        redirect_back fallback_location: root_path, notice: 'Review was successfully created.'
      end
    else
      render 'new'
    end
  end


  private

  def find_reviewable
    if params[:restaurant_id]
      Restaurant.find_by(id: params[:restaurant_id])
    elsif params[:dish_id]
      Dish.find_by(id: params[:dish_id])
    else
      nil
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

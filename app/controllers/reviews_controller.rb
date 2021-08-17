class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @rocket = Rocket.find(params[:rocket_id])
    @review = Review.new(review_params)
    @review.rocket = @rocket
    if @review.save
      redirect_to rocket_path(@rocket)
    else
      render "rockets/show"
    end
  end

  private

  def review_params
    @review = Review.find(params[:id])
  end
end

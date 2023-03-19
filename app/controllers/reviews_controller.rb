class ReviewsController < ApplicationController
  def index
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to ramen_shop_reviews_path(@review.movie)
    else
      @movie = Movie.find(params[:movie_id])
      render "movies/show"
    end
  end

end

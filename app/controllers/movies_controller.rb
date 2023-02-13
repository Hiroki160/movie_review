class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movie_path(@movie), notice: "投稿に成功しました。"
    else
      render :new
    end
  end

  def edit
  end

  def movie_params
    params.require(:movie).permit(:title, :body)
  end
end

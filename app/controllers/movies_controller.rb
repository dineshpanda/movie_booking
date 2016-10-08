class MoviesController < ApplicationController

  def index
    @screened_movies = Movie.screened
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end
  
end

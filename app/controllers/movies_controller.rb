class MoviesController < ApplicationController
  def new
    @new_movie = Movie.new
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }

      format.html
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
  end
 
  def create
    #movie_params = params.require(:movie).permit(:title, :description)
    
    @movie = Movie.new(movie_params)

    if @movie.valid?
      @movie.save

      redirect_to movies_url, notice: "Movie created successfully."
    else
      render "new"
    end
  end

  def edit
    @the_movie = Movie.find(params.fetch(:id))
  end

  def update
    @movie = Movie.find(params.fetch(:id))

    #movie_params = params.require(:movie).permit(:title, :description)
    
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie updated successfully."
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
  private
  def movie_params
    params.require(:movie).permit(:title, :description,:released_on)
   end
end

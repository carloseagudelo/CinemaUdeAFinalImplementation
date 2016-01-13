class MovieController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
    @comments = Comment.all
    @seats = Seat.all
	end

	def new
    	@movie = Movie.new
    	@horaries = Horary.all
    	@halls = Hall.all
    	@chairs = Chair.all
    	@qualities = Quality.all
  end

  def create
    @movie = Movie.new(movie_params)
      if @movie.save
      	redirect_to 
    	else
      	redirect_to 
    	end
	end

	def edit
		@movie = Movie.find(params[:id])
		@horaries = Horary.all
  	@halls = Hall.all
  	@chairs = Chair.all
  	@qualities = Quality.all
  end

  	def update
	    
	    if @movie.update(movie_params)
	        redirect_to 
	    else
	        redirect_to 
	    end	    
  	end

  	def destroy
  		@movie = Movie.find(params[:id])
	    if @movie.destroy
	    	redirect_to 
	    else
	    	redirect_to 
	    end
  	end
 
private

	def movie_params
      params.require(:movie).permit(:horary_id, :hall_id, :name, :duration, :information, :dimension, :quality_id, :chairs_id, :priceGeneral, :pricePopular, :pointsGeneral, :pountsPopular, :setPointsGeneral, :setPointsPopuar)
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end   

end

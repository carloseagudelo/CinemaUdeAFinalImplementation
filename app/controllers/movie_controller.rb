class MovieController < ApplicationController

	def index
    if params[:searchName] || params[:searchHallName]
      if params[:searchName]
      @movies = Movie.search(params[:searchName])
      elsif params[:searchHallName]
        @movies = Movie.search1(params[:searchHallName])
      else
        @movies = Movie.all
      end
    else
      @movies = Movie.all
    end

	end

	def show
		@movie = Movie.find(params[:id])
    @comments = Comment.all
    @hall = Hall.find(@movie.hall_id)
    @seat = Seat.find(@hall.seat_id)
	end

	def new
    	@movie = Movie.new
    	@horaries = Horary.all
    	@halls = Hall.all
    	@qualities = Quality.all
  end

  def create
    @movies = Movie.all
    control = true
    @movie = Movie.new(movie_params)
    @movies.each do |mv|
      if (@movie.horary_id == mv.horary_id) && (@movie.hall_id = mv.hall_id)
        control = false
      end
    end
    if control
      if @movie.save
      	redirect_to 
    	else
      	redirect_to 
    	end
    else
      redirect_to @movie, notice: 'En la sala especificada y en el horario especificado ya se estara presentando otra pelicula'
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
      params.require(:movie).permit(:horary_id, :hall_id, :name, :duration, :information, :quality_id, :chairs_id, :priceGeneral, :pricePopular, :pointsGeneral, :pountsPopular, :setPoints, :image)
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end   

end

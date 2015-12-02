class ChairsController < ApplicationController

  def index
    @chairs = Chair.all
  end

  def show
  	@chair = Chair.find(params[:id])
  end


  def new
    @chair = Chair.new
  end


  def edit
  	@chair = Chair.find(params[:id])
  end


  def create
    @chair = Chair.new(chair_params)
  	if @chair.save
      redirect_to chairs_path
  	else
      redirect_to  new_chair_path
  	end
  end


  def update
 	  if @chair.update(chair_params)
      redirect_to chairs_path
  	else
      edirect_to chair_path
  	end
  end


  def destroy
  	@chair = Chair.find(params[:id])
    @chair.destroy
  end

private

    def set_chair
      @chair = Chair.find(params[:id])
    end

    def chair_params
      params.require(:chair).permit(:numberChairP, :numberChairG, :occupiedP, :occupiedG, :name)
    end
end

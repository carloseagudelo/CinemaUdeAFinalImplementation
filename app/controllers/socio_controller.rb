class SocioController < ApplicationController

	def index 
		@socios = User.all
	end

	def show
		@socio = User.find(params[:id])
	end

	def new
    	@socio = User.new
  	end

  	def create
	    @socio = User.new(socio_params)

        if @socio.save
        	redirect_to socio_index_path
      	else
        	redirect_to new_socio_path
      	end
	end

	def edit
		@socio = User.find(params[:id])
  	end

  	def update
	    
	    if @socio.update(socio_params)
	        redirect_to socio_index_path
	    else
	        redirect_to socio_path
	    end	    
  	end

  	def destroy
  		@socio = User.find(params[:id])
	    @socio.destroy
	   	redirect_to socio_index_path
  	end

private

	def set_socio
      @socio = User.find(params[:id])
    end

    def socio_params
      params.require(:user).permit(:name, :document, :lastName, :email, :numberPoint)
    end


end

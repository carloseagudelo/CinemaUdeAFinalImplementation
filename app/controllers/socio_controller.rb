class SocioController < ApplicationController

	def index 
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
  	end

  	def update
	    if @user.update(socio_params)
	        redirect_to socio_index_path
	    else
	        redirect_to socio_path
	    end	    
  	end

  	def destroy
  		@user = User.find(params[:id])
	    @user.destroy
	   	redirect_to socio_index_path
  	end

private
  def socio_params
    params.require(:user).permit(:name, :document, :lastName, :email, :numberPoint)
  end


end

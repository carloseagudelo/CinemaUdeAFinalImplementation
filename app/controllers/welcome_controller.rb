class WelcomeController < ApplicationController

	def index
		@movies = Movie.where("created_at >= ?", 30.days.ago)				  
	end
end

Movie.where("created_at >= ?", Time.zone.now.beginning_of_day)
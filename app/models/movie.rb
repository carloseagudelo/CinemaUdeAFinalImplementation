class Movie < ActiveRecord::Base
  belongs_to :horary
  belongs_to :hall
  belongs_to :quality
  has_many :comments

    mount_uploader :image, ImageUploader

  	def self.search(query)
    	Movie.where("name like ?", "%#{query}%")     	
  	end

  	def self.search1(query)
  		Movie.joins("LEFT JOIN halls ON halls.id = movies.hall_id").where("halls.name like ?", "%#{query}%") 	
   	end

end

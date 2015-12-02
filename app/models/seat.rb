class Seat < ActiveRecord::Base
	has_many :movies
end

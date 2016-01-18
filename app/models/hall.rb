class Hall < ActiveRecord::Base
  belongs_to :seat
  has_and_belongs_to_many :movies

end

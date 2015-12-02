class Movie < ActiveRecord::Base
  belongs_to :horary
  belongs_to :hall
  belongs_to :chairs
  belongs_to :quality
  has_many :comments
end

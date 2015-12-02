class Boletu < ActiveRecord::Base
  belongs_to :movie
  belongs_to :ticket
end

class User < ActiveRecord::Base

  has_many :comment
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

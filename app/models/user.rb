class User < ActiveRecord::Base

  resourcify

  has_many :comment
  belongs_to :role

  rolify :before_add => :before_add_method

  after_create :assign_default_role

  def assign_default_role
    add_role(:user) if self.roles.blank?
  end

  def before_add_method(role)
    # do something before it gets added
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

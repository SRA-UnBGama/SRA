class User < ActiveRecord::Base
  rolify
  acts_as_superclass
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :timeoutable, :authentication_keys => [:username]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me,:name

  def email_required?
    false
  end

  def email_changed?
    false
  end


end

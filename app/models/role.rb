#Class that describes the roles for all users on the system
class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  attr_accessible :display_name
  scopify
  # attr_accessible :title, :body
end

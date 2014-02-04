# -*- encoding : utf-8 -*-
class Type < ActiveRecord::Base
  has_and_belongs_to_many :places
  attr_accessible :name, :place_ids, :places
  
  validates_presence_of :name

  
end

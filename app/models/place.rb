# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base
  has_many :atendimentos
  has_and_belongs_to_many :types
  attr_accessible :name, :type_ids, :types, :active
  validates_presence_of :name, :types
  validates_uniqueness_of :name, :case_sensitive => false
  scope :ordened, :order => "name ASC"

  def set_status
    if self.active == false
      self.active = true
    else
      self.active = false
    end

    self.save
  end

end

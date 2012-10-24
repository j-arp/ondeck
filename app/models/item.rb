class Item < ActiveRecord::Base
  belongs_to :status
  belongs_to :program
  attr_accessible :bcid, :description, :effort_level, :title, :status_id, :program_id, :week, :year
  
  validates_presence_of :title, :status_id, :program_id, :week, :year 
end

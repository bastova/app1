class Pet < ActiveRecord::Base
	attr_accessible :name, :age, :user_id
	self.inheritance_column = nil
	belongs_to :user
	validates_presence_of :name
end

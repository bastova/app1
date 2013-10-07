class Pet < ActiveRecord::Base
	attr_accessible :name, :age, :user_id
	belongs_to :user
	validates_presence_of :name
end

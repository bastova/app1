class Guild < ActiveRecord::Base
	attr_accessible :name, :motto
	has_many :users
	validates_presence_of :name
end

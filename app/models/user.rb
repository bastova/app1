class User < ActiveRecord::Base
	has_many :pets
	attr_accessible :name, :email, :password
	belongs_to :guild
	validates_presence_of :name
end

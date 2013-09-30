class User < ActiveRecord::Base
	has_many :pets
	belongs_to :guild
	validates_presence_of :name
end

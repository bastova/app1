class Authorization < ActiveRecord::Base
	belongs_to :user
	attr_accessible :provider, :uid, :user_id, :user 
	validates :provider, :uid, :presence => true
	
end

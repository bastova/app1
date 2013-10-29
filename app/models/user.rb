class User < ActiveRecord::Base
	has_many :authorizations
	validates :name, :email, :presence => true
	has_many :pets
	attr_accessible :name, :email, :password
	belongs_to :guild
	#validates :password, length: {minimum: 6}
	emailFormatValidation = /[a-z.-]+@[a-z \d -.]+[.][a-z]+/i 
	validates :email, format: {with: emailFormatValidation}
	validates :email, uniqueness: true
	#validates :password, confirmation: true
end

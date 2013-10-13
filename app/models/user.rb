class User < ActiveRecord::Base
	has_many :pets
	attr_accessible :name, :email, :password
	belongs_to :guild
	validates :name, presence: true
	validates :password, length: {minimum: 6}
	emailFormatValidation = /[a-z.-]+@[a-z \d -.]+[.][a-z]+/i 
	validates :email, format: {with: emailFormatValidation}
	validates :email, uniqueness: true
	validates :password, confirmation: true

end

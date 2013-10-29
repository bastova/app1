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
	
	def add_provider(auth_hash)
	  # Check if the provider already exists, so we don't add it twice
	  unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	  end
	end

end

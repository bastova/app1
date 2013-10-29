class Authorization < ActiveRecord::Base
	belongs_to :user
	attr_accessible :provider, :uid, :user_id, :user 
	validates :provider, :uid, :presence => true
	
	def self.find_or_create(auth_hash)
	  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	  if @authorization
		render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
	  else
		user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
		user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
		user.save
	 
		render :text => "Hi #{user.name}! You've signed up."
	  end
	 
	  auth = @authorization
	end
end

class SessionsController < ApplicationController
  def new
  end


  def create
	  auth_hash = request.env['omniauth.auth']
	 
	  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	  if @authorization
		render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
		session[:user_id] = @authorization.user.id
	  else
		user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
		user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
		user.save
	 
		render :text => "Hi #{user.name}! You've signed up."
		session[:user_id] = user.id
		
	  end
	end

=begin
def create
  auth_hash = request.env['omniauth.auth']
 
  
    # Log him in or sign him up
    auth = Authorization.find_or_create(auth_hash)
 
    # Create the session
    session[:user_id] = auth.user.id
 
    render :text => "Welcome #{auth.user.name}!"
end
=end

  def failure
	  render :text => "Sorry, but you didn't allow access to our app!"
	end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

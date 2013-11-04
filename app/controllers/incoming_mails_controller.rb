class IncomingMailsController < ApplicationController    
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    Rails.logger.log Logger::INFO, message.subject #print the subject to the logs
    Rails.logger.log Logger::INFO, message.body.decoded #print the decoded body to the logs

    # Do some other stuff with the mail message

	@mail = Message.new
	@mail.write_attribute(:subject, message.subject)
	@mail.set_attribute(:body, message.body.decoded)
	@mail.save
	
    render :text => 'success', :status => 200 # a status of 404 would reject the mail
	redirect_to incoming_mails_path
  end
  
  def index
	@messages = Messages.all
  end
end

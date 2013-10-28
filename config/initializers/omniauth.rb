Rails.application.config.middleware.use OmniAuth::Builder do
  #OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :facebook, '639725102717284', 'd342f594c8ebc05da5a0fcb84ae9b6d9', {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
  
end
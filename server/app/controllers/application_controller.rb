class ApplicationController < ActionController::Base
  protect_from_forgery
	respond_to :json,:xml,:html
	
	
	before_filter :authenticate
	
  def authenticate
    authenticate_or_request_with_http_basic do |username, apitoken|
      username == "username" && apitoken == "123"
    end 
  end
end

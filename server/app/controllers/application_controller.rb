class ApplicationController < ActionController::Base
  protect_from_forgery
	respond_to :json,:xml,:html
	
end

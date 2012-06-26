class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :json,:xml,:html
  ##add login method
   
  private
  
  # def restrict_access
  #   api_key = ApiKey.find_by_access_token(params[:access_token])
  #   head :unauthorized unless api_key
  # end
  
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
  
  
end

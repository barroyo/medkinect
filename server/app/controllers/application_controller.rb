class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  $role_access =  {"All" => "all", "Medium" => "med",'Basic' => 'bas'}
  $role_access_labels =  {"all" => "All", "med" => "medium",'bas' => 'Basic'}

  $calendars_type = {"Medical Consultation" => "mc", "Date" => "dt"}
  $calendars_type_label ={"mc" => "Medical Consultation","dt" => "Date"}
  respond_to :json,:xml,:html
  ##add login method
   
  
  # def restrict_access
  #   api_key = ApiKey.find_by_access_token(params[:access_token])
  #   head :unauthorized unless api_key
  # end
  def require_login
    if session[:user].nil?
      flash[:message] = "Login Required"
      redirect_to :login_path
    end
  end


  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
  

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user].id) if session[:user]
  end
  
end

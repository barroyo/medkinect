class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  $role_access =  {"All" => "all", "Medium" => "med",'Basic' => 'bas'}
  $role_access_labels =  {"all" => "All", "med" => "medium",'bas' => 'Basic'}

  $calendars_type = {"Medical Consultation" => "mc", "Date" => "dt"}
  $calendars_type_label ={"mc" => "Medical Consultation","dt" => "Date"}


  $blood_type = {"A+" => 0 , "A-" => 1, "B+" => 2, "B-" => 3,
    "O+" => 4, "O-" => 5, "AB+" => 6, "AB+-" => 7}
  $blood_type_label = {  0 => "A+",  1 => "A-", 2 => "B+",  3 => "B-",
     4 => "O+",  5 => "O-", 6 => "AB+", 7 => "AB+-" }
  respond_to :json,:xml,:html
  ##add login method
   
   def validate_admin_access
    if current_user.role.access != 'all'
      flash[:class_css] = 'error'
      flash[:notice] = "You do not have access for #{params[:controller]} #{params[:action]}"
      redirect_to home_path
    end
  end  
  
  def validate_medium_access_current
    if (current_user.role.access != 'all' && current_user.role.access != 'med' ) && (current_user.id.to_s != params[:id].to_s)
      flash[:class_css] = 'error'
      flash[:notice] = "You do not have access for #{params[:controller]} #{params[:action]}"
      redirect_to home_path
    end
  end 

 def validate_medium_access
    if current_user.role.access != 'all' && current_user.role.access != 'med' 
      flash[:class_css] = 'error'
      flash[:notice] = "You do not have access for #{params[:controller]} #{params[:action]}"
      redirect_to home_path
    end
  end 

  def validate_current_user
     if current_user.id.to_s != params[:id].to_s 
        flash[:class_css] = 'error'
        flash[:notice] = "You do not have access for #{params[:controller]}"
        redirect_to home_path
      end
  end

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
  helper_method :admin_access, :admin_med_access

  private

  def current_user
    @current_user ||= User.find(session[:user].id) if session[:user]
  end

  def admin_access
    return current_user.role.access == 'all'
  end

   def admin_med_access
    return current_user.role.access == 'all' || current_user.role.access == 'med'
  end
  
end

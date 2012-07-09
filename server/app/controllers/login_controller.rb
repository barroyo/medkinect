class LoginController < ApplicationController
  def index
    if !session[:user].nil?
      redirect_to :root_loged
    else
      respond_to { |format|
        format.html
      }
    end
  end

  def login
    if session[:user] = User.authenticate(params[:username], params[:password])
      redirect_to :controller => "users", :action => "index"
    else
      flash[:message] = "Enter valid credentials!"
      redirect_to :action => "index"
    end
  end

  def logout
    session[:user]= nil
    redirect_to :action => "index"
  end
end

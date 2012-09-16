class TwitterController < ApplicationController
  
  before_filter :require_login
  
  def index
  	@twi = Twitter.user_timeline("medkinect")
  	respond_to do |format|
  		format.json {render json: @twi}
  	end
  end

  def post
  	 token = session[:user].integration.token
  	 secret = session[:user].integration.secret
  	@client = Twitter::Client.new(
		  :oauth_token => token,
		  :oauth_token_secret => secret
		)
  	respond_to do |format|
  		format.json {render json: @client.update("From Our Web Application")}
  	end
  end
end

class TwitterController < ApplicationController
  
  before_filter :require_login
  
  def index
  	@twi = Twitter.user_timeline("medkinect")
  	respond_to do |format|
  		format.json {render json: @twi}
  	end
  end

  def post
  	token = current_user.integration.token
  	secret = current_user.integration.secret
  	@client = Twitter::Client.new(
		  :oauth_token => token,
		  :oauth_token_secret => secret
		)
     
  	
      begin
        @client.update(params[:tweet_text])
        flash[:notice] = 'Tweet Sent Successfully'
      rescue Exception => e
        flash[:notice] = "Tweet failed, #{e.message}"
      end
      redirect_to home_path
  end
end

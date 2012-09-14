class TwitterController < ApplicationController
  def index
  	@twi = Twitter.user_timeline("medkinect")
  	respond_to do |format|
  		format.json {render json: @twi}
  	end
  end

  def post
  	@client = Twitter::Client.new(
		  :oauth_token => "126003850-KX749IRsyiYiZMexGKHnuoxiJNHL5ayt766bkPhy",
		  :oauth_token_secret => "KZuFqUmzPXJR2C7Qd2asgZInEaTBs5G5gecDeFosI"
		)
  	respond_to do |format|
  		format.json {render json: @client.update("Hi Every1 !")}
  	end
  end
end

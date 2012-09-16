class HomeController < ApplicationController

	before_filter :require_login
	
  def index
  	@twi = Twitter.user_timeline("medkinect").first(5)
  	respond_to do |format|
  		format.html
  		format.json {render json: @twi}
  	end
  end
end

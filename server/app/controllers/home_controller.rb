class HomeController < ApplicationController

	before_filter :require_login
	
  def index
  	@twi = []
  	begin
  		@twi = Twitter.user_timeline("medkinect").first(5)
  	rescue Exception => e
  		flash[:notice] = e.message
  		flash[:class_css] = 'error'
  	end
  	respond_to do |format|
  		format.html
  		format.json {render json: @twi}
  	end
  end
end

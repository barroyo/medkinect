class IntegrationsController < ApplicationController

	before_filter :require_login
	
	def create
		auth = request.env["omniauth.auth"]
		integration = Integration.find_by_user_id_and_provider(session[:user].id,auth["provider"])

		if integration.nil?
			integration = Integration.create_with_omniauth(session[:user],auth)
			integration.save
		end 

		redirect_to :home, :notice => "Twitter Successfully Integrated"
	end
end

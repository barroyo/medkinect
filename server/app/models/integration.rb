class Integration < ActiveRecord::Base
	belongs_to :user
	def self.create_with_omniauth(user,auth)
	  create! do |integration|
	    integration.user_id = user.id
	    integration.provider = auth["provider"]
	    integration.provider_uid = auth["uid"]
	    integration.token = auth["credentials"]["token"]
	    integration.secret = auth["credentials"]["secret"]
	  end
	end
end

class User < ActiveRecord::Base
	def self.create_with_omniauth(auth)
		create! do |user|
			user.name = auth['info']['name']
			user.provider_id = auth['info']['nickname']
			user.provider = auth['provider']
			user.uid = auth['uid']
			user.role = "members"
		end
	end
end

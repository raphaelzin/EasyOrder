class Client < ApplicationRecord
	has_and_belongs_to_many :dishes
	belongs_to :table

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
	 :default_url => ActionController::Base.helpers.asset_path('default-avatar.png')
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	
	def bill_value
		total = 0
		dishes.each do |d|
			total += d.price
		end
		total
	end

	def self.from_omniauth(auth)
    	where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |client|
      client.provider = auth.provider
      client.uid = auth.uid
      client.name = auth.info.name
      
      client.oauth_token = auth.credentials.token
      client.oauth_expires_at = Time.at(auth.credentials.expires_at)
      client.table = Table.find_by(number: 0)
      client.save!
    end
  end
end

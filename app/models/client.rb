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

	def first_name
    self.name.gsub(/\s+/m, ' ').strip.split(" ")[0]
  end

  def last_name
  	if self.name.gsub(/\s+/m, ' ').strip.split(" ").count > 1
  		self.name.gsub(/\s+/m, ' ').strip.split(" ")[-1]
  	end
  end

  def first_last_name
  	"#{first_name} #{last_name}"
  end

  def avatar_url
  	if self.uid.present?
  		"http://graph.facebook.com/#{self.uid}/picture?type=large"
  	else	
    	ActionController::Base.helpers.asset_path('default-avatar.png')
    end
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

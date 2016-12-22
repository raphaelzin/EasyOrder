class Dish < ApplicationRecord
	belongs_to :category

	has_many :clients, :through => :order_tags
	has_many :order_tags

	has_and_belongs_to_many :orders

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>", xs: "50x50>" },
	 :default_url => ActionController::Base.helpers.asset_path('default-dish.png')
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end

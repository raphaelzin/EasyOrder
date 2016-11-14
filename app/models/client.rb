class Client < ApplicationRecord
	has_and_belongs_to_many :dishes
	belongs_to :table

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def bill_value
		total = 0
		dishes.each do |d|
			total += d.price
		end
		total
	end
end

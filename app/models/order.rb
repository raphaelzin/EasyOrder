class Order < ApplicationRecord
	has_and_belongs_to_many :dishes
	belongs_to :waiter
	belongs_to :client

	def bill_value
		total = 0
		dishes.each do |d|
			total += d.price
		end
		total
	end
	
end

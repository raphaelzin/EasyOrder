class Order < ApplicationRecord
	has_and_belongs_to_many :dishes
	belongs_to :waiter
	belongs_to :client

	def self.search(start_period, end_period)
	  Order.where("created_at >= ? AND created_at <= ?", start_period, end_period)
	end

	def bill_value
		total = 0
		dishes.each do |d|
			total += d.price
		end
		total
	end
end

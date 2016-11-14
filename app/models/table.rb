class Table < ApplicationRecord
  belongs_to :waiter
  has_many :clients

  def bill_value
		total = 0
		clients.each do |c|
			total += c.bill_value
		end
		total
	end
end
class Table < ApplicationRecord
  belongs_to :waiter
  has_many :clients
  validates :number, :uniqueness => true

  	def bill_value
		total = 0
		clients.each do |c|
			total += c.bill_value
		end
		total
	end


	def set_code
		# Generate a random word with 8 characters
		while true do
	        o = [('1'..'9'),('a'..'z')].map { |i| i.to_a }.flatten
	        newCode = (0...8).map { o[rand(o.length)] }.join  
	        if not Table.find_by(code: newCode)
	          	break
	        end
	    end
	    self.code = newCode
	end
end

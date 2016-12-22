class Waiter < ApplicationRecord
	has_many :tables
	has_many :orders
	has_secure_password
	validates :name, presence: true
	
end

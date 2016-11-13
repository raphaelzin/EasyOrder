class Dish < ApplicationRecord
	belongs_to :category
	has_and_belongs_to_many :clients
	has_and_belongs_to_many :orders
end

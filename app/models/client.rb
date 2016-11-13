class Client < ApplicationRecord
	has_and_belongs_to_many :dishes
	belongs_to :table
end

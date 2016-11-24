class Category < ApplicationRecord
	has_many :dishes
	belongs_to :menu

	def category_with_language
		"#{name} (#{self.menu.language})"
	end
end

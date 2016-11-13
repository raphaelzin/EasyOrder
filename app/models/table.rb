class Table < ApplicationRecord
  belongs_to :waiter
  has_many :clients
end

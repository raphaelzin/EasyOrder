class AddDishRefToOrderTag < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_tags, :dish, foreign_key: true
  end
end

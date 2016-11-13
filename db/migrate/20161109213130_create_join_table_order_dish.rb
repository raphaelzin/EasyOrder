class CreateJoinTableOrderDish < ActiveRecord::Migration[5.0]
  def change
    create_join_table :orders, :dishes do |t|
      # t.index [:order_id, :dish_id]
      # t.index [:dish_id, :order_id]
    end
  end
end

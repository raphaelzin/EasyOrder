class CreateJoinTableClientDish < ActiveRecord::Migration[5.0]
  def change
    create_join_table :clients, :dishes do |t|
      # t.index [:client_id, :dish_id]
      # t.index [:dish_id, :client_id]
    end
  end
end

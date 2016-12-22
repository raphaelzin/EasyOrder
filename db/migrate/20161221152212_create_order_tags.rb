class CreateOrderTags < ActiveRecord::Migration[5.0]
  def change
    create_table :order_tags do |t|
      t.timestamps
    end
  end
end

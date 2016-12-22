class AddClientRefToOrderTag < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_tags, :client, foreign_key: true
  end
end

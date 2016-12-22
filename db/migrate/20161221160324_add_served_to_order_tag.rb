class AddServedToOrderTag < ActiveRecord::Migration[5.0]
  def change
    add_column :order_tags, :served, :boolean
  end
end

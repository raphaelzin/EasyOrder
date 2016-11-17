class AddFieldsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :checking_out, :boolean
    add_column :clients, :done, :boolean
    add_column :clients, :payment_method, :string
  end
end

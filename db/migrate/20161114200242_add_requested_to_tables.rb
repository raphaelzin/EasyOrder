class AddRequestedToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :requested, :boolean
  end
end

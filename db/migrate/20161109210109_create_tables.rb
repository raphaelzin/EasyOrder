class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.string :code, :unique => true
      t.integer :number, :unique => true
      t.references :waiter, foreign_key: true

      t.timestamps
    end
  end
end

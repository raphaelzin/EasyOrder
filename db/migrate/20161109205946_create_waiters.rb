class CreateWaiters < ActiveRecord::Migration[5.0]
  def change
    create_table :waiters do |t|
      t.string :name
      t.string :cpf
      t.string :phone
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end

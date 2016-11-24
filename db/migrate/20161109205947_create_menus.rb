class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :language
      t.string :locale
      t.timestamps
    end
  end
end

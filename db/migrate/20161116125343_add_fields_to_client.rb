class AddFieldsToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :provider, :string
    add_column :clients, :oauth_token, :string
    add_column :clients, :oauth_expires_at, :datetime
    add_column :clients, :uid, :string
  end
end

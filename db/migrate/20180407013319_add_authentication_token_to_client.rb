class AddAuthenticationTokenToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :authentication_token, :string, limit: 30
    add_index :clients, :authentication_token, unique: true
  end
end
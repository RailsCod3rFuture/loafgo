class DeviseTokenAuthCreateClients < ActiveRecord::Migration[5.1]
  def change
    ## Required
    add_column :clients, :provider, :string, :null => false, :default => "email"
    add_column :clients, :uid, :string, :null => false, :default => ""

    ## Tokens
    add_column :clients, :tokens, :json

    add_index :clients, [:uid, :provider], unique: true
  end
end

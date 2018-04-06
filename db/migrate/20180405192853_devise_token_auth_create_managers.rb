class DeviseTokenAuthCreateManagers < ActiveRecord::Migration[5.1]
  def change
    ## Required
    add_column :managers, :provider, :string, :null => false, :default => "email"
    add_column :managers, :uid, :string, :null => false, :default => ""

    ## Tokens
    add_column :managers, :tokens, :json

    add_index :managers, [:uid, :provider], unique: true
  end
end

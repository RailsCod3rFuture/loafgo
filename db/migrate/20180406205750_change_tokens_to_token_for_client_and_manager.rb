class ChangeTokensToTokenForClientAndManager < ActiveRecord::Migration[5.1]
  def change
    rename_column :clients, :tokens, :token
    rename_column :managers, :tokens, :token
    change_column :clients, :token, :string
    change_column :managers, :token, :string
  end
end

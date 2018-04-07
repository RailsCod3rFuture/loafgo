class RenameTokenTokensForClientAndManager < ActiveRecord::Migration[5.1]
  def change
    rename_column :clients, :token, :tokens
    rename_column :managers, :token, :tokens
  end
end

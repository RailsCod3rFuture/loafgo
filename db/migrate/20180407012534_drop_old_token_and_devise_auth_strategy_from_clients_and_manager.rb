class DropOldTokenAndDeviseAuthStrategyFromClientsAndManager < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :confirmation_sent_at
    remove_column :clients, :confirmed_at
    remove_column :clients, :provider
    remove_column :clients, :uid
    remove_column :clients, :confirm_success_url
    remove_column :clients, :tokens

    remove_column :managers, :confirmation_sent_at
    remove_column :managers, :confirmed_at
    remove_column :managers, :provider
    remove_column :managers, :uid
    remove_column :managers, :confirm_success_url
    remove_column :managers, :tokens
  end
end

class AddConfirmableToClient < ActiveRecord::Migration[5.1]
  def change
    change_table(:clients) do |t|
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :confirm_success_url
    end
    add_index :clients, :confirmation_token, :unique => true
  end
end

class CheckingAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :checking_accounts do |t|
      t.string :account_number 
      t.decimal  :balance, precision: 15, scale: 2
      t.integer :client_id
    end
  end
end


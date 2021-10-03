class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :date 
      t.string :description 
      t.decimal :amount, precision: 15, scale: 2
      t.integer :checking_account_id
    end
  end
end

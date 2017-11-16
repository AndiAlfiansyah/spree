class CreateSpreeSpreeVirtualAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_virtual_accounts do |t|
      t.string :number
      t.string :bank_id
      t.string :name
      t.decimal :suggested_amount
      t.boolean :is_closed
      t.decimal :expected_amount
      t.date :expiration_date
      t.boolean :is_single_use
      t.string :external_id
      t.datetime :transaction_timestamp
      t.decimal :amount
      t.string :merchant_code
      t.string :callback_virtual_account_id
      t.string :payment_id
      t.string :registered_id

      t.timestamps
    end
  end
end

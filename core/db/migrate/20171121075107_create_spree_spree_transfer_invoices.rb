class CreateSpreeSpreeTransferInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_spree_transfer_invoices do |t|
      t.datetime :expiry_date
      t.string :invoice_url
      t.integer :amout
      t.string :payer_email
      t.integer :user_id
      t.string :description
      t.integer :external_id
      t.string :status
      t.integer :invoice_id

      t.timestamps
    end
  end
end

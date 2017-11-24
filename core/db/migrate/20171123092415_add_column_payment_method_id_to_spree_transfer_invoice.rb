class AddColumnPaymentMethodIdToSpreeTransferInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_transfer_invoices, :payment_method_id, :integer
  end
end

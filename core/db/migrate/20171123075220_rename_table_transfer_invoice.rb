class RenameTableTransferInvoice < ActiveRecord::Migration[5.1]
  def change
    rename_table :spree_spree_transfer_invoices, :spree_transfer_invoices
  end
end

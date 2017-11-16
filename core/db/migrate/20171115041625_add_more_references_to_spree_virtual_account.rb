class AddMoreReferencesToSpreeVirtualAccount < ActiveRecord::Migration[5.1]
  def change
    add_reference :spree_virtual_accounts, :user, foreign_key: true
    add_reference :spree_virtual_accounts, :payment_method, foreign_key: true
  end
end

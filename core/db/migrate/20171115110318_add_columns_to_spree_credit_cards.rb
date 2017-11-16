class AddColumnsToSpreeCreditCards < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_credit_cards, :tokenization_status, :string
    add_column :spree_credit_cards, :token_id, :string
  end
end

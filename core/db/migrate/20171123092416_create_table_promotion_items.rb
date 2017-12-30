class CreateTablePromotionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_promotion_items do |t|
      t.string :discount
      t.string :action_disc
      t.integer :quantity 

      t.timestamps null: false
    end
  end
end

class CreateSpreeImportExports < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_import_exports do |t|
      t.string :name
      t.string :descriptions
      t.timestamps null: false
    end
  end
end

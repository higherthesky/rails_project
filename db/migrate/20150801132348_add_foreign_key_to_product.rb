class AddForeignKeyToProduct < ActiveRecord::Migration
  def change
    add_foreign_key :products, :catalogs, on_delete: :cascade
  end
end

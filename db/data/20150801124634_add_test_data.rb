class AddTestData < SeedMigration::Migration
  def up
    1.upto(5).each do |number|
      catalog = Catalog.create!(name: "catalog_name_#{number}", description: "catalog_description_#{number}")
      1.upto(5).each do |index|
        Product.create!(name: "product_name_#{index}", description: "product_description_#{index}", price: index, catalog: catalog)
      end
    end
  end

  def down
    Catalog.destroy_all
    Product.destroy_all
  end
end

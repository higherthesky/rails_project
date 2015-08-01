json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :catalog_id
  json.url product_url(product, format: :json)
end

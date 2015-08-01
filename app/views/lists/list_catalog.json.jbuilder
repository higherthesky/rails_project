json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :name, :description
end

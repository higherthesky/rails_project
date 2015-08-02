json.array!(@posts) do |catalog|
  json.extract! catalog, :id, :name, :description
end

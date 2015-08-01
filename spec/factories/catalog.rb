FactoryGirl.define do
  factory :catalog, class: 'Catalog' do
    sequence(:name) { |n| "catalog name #{n}" }
    sequence(:description) { |n| "catalog desc #{n}" }
  end
end

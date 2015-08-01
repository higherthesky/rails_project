FactoryGirl.define do
  factory :product, class: 'Product' do
    sequence(:name) { |n| "product name #{n}" }
    sequence(:description) { |n| "product desc #{n}" }
    sequence(:price) { |n| n }

    association :catalog
  end
end

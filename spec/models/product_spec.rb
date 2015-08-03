require 'spec_helper'

describe 'Product', type: :model do
  it 'default factory - valid' do
    expect(build(:product)).to be_valid
  end

  context 'valid without' do
    it 'description' do
      expect(build(:product, description: nil)).to be_valid
    end
    it 'price' do
      expect(build(:product, price: nil)).to be_valid
    end
  end

  context 'invalid without' do
    it 'name' do
      expect(build(:product, name: nil)).to be_invalid
    end
    it 'catalog_id' do
      expect(build(:product, catalog_id: nil)).to be_invalid
    end
  end

  it 'by catalog' do
    catalog = create :catalog
    create :product
    product_2 = create :product, catalog: catalog
    product_3 = create :product, catalog: catalog
    expect(catalog.products).to match_array([product_2, product_3])
  end
end

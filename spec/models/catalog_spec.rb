require 'spec_helper'

describe 'Catalog', type: :model do
  it 'default factory - valid' do
    expect(build(:catalog)).to be_valid
  end

  context 'valid without' do
    it 'description' do
      expect(build(:catalog, description: nil)).to be_valid
    end
  end

  context 'invalid without' do
    it 'name' do
      expect(build(:catalog, name: nil)).to be_invalid
    end
  end
end

require 'spec_helper'

describe 'Product' do
  subject { page }

  before do
    @product_1 = @post_1 = create :product
    @product_2 = @post_2 = create :product
    visit products_path
  end

  it_behaves_like 'base record'

  let(:new_name) { 'new name' }
  let(:new_description) { 'new description' }
  let(:new_price) { 1 }

  context 'new record' do
    before do
      @new_catalog = create :catalog
      click_link 'new_record'
    end

    it 'correct fields - success' do
      expect do
        fill_in 'product_name', with: new_name
        fill_in 'product_description', with: new_description
        fill_in 'product_price', with: new_price
        select @new_catalog.name, from: 'product_catalog_id'
        click_button 'save_record'
        expect(page).to have_content new_name
      end.to change(Product, :count).by(1)
    end

    it 'empty fields - error' do
      expect do
        click_button 'save_record'
        expect(page).to have_css 'div#error_explanation'
      end.not_to change(Product, :count)
    end
  end

  context 'edit record' do
    before do
      @new_catalog = create :catalog
      click_link "edit_record_#{@product_1.id}"
    end

    it 'correct fields - success' do
      fill_in 'product_name', with: new_name
      fill_in 'product_description', with: new_description
      fill_in 'product_price', with: new_price
      select @new_catalog.name, from: 'product_catalog_id'
      click_button 'save_record'
      expect(page).to have_content new_name
    end

    it 'empty fields - error' do
      expect do
        fill_in 'product_name', with: nil
        click_button 'save_record'
        expect(page).to have_css 'div#error_explanation'
      end.not_to change(Product, :count)
    end
  end
end

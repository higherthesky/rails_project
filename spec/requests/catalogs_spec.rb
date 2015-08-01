require 'spec_helper'

describe 'Catalog' do
  subject { page }

  before do
    @catalog_1 = @post_1 = create :catalog
    @catalog_2 = @post_2 = create :catalog
    visit catalogs_path
  end

  it_behaves_like 'base record'

  let(:new_name) { 'new name' }
  let(:new_description) { 'new description' }

  context 'new record' do
    before do
      click_link 'new_record'
    end

    it 'correct fields - success' do
      expect do
        fill_in 'catalog_name', with: new_name
        fill_in 'catalog_description', with: new_description
        click_button 'save_record'
        expect(page).to have_content new_name
      end.to change(Catalog, :count).by(1)
    end

    it 'empty fields - error' do
      expect do
        click_button 'save_record'
        expect(page).to have_css 'div#error_explanation'
      end.not_to change(Catalog, :count)
    end
  end

  context 'edit record' do
    before do
      click_link "edit_record_#{@catalog_1.id}"
    end

    it 'correct fields - success' do
      fill_in 'catalog_name', with: new_name
      fill_in 'catalog_description', with: new_description
      click_button 'save_record'
      expect(page).to have_content new_name
    end

    it 'empty fields - error' do
      expect do
        fill_in 'catalog_name', with: nil
        click_button 'save_record'
        expect(page).to have_css 'div#error_explanation'
      end.not_to change(Catalog, :count)
    end
  end
end

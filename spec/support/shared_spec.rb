shared_examples 'base record' do
  let(:record_model) { @post_1.class.name.constantize }
  let(:record_name) { @post_1.class.name.underscore }
  let(:records_name) { @post_1.class.name.underscore.pluralize }

  context 'show records' do
    it 'have content' do
      expect(page).to have_content @post_1.name
      expect(page).to have_content @post_2.name
    end
  end

  context 'show record' do
    it 'have content' do
      edit_record_path = Rails.application.routes.url_helpers.send("edit_#{record_name}_path", @post_1)
      index_path = Rails.application.routes.url_helpers.send("#{records_name}_path")

      click_link "show_record_#{@post_1.id}"
      expect(page).to have_content @post_1.name
      expect(page).to have_link("edit_record_#{@post_1.id}", text: 'Edit', href: edit_record_path)
      expect(page).to have_link('back_page', text: 'Back', href: index_path)
      expect(page).not_to have_content @post_2.name
    end
  end

  context 'destroy record' do
    it 'success', js: true do
      index_path = Rails.application.routes.url_helpers.send("#{records_name}_path")
      expect do
        click_link "destroy_record_#{@post_1.id}"
        page.driver.browser.accept_js_confirms
        expect(current_path).to eq index_path
      end.to change(record_model, :count).by(-1)
    end
  end
end

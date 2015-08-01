require 'spec_helper'

describe 'ListsController', type: :controller do
  before do
    @controller = ListsController.new
  end

  after do
    def render_views?
      true
    end
  end

  describe "GET list_catalog.json" do
    it "assigns all catalogs as @catalogs" do
      catalog = create :catalog
      get :list_catalog, { format: :json }
      expect(response.status).to eq 200
      expect(assigns(:catalogs)).to eq([catalog])
    end
  end

  describe "GET list_product.json" do
    it "assigns all products as @products with catalog_id" do
      catalog = create :catalog
      product = create :product, catalog: catalog
      get :list_product, { format: :json, catalog_id: catalog.to_param }
      expect(response.status).to eq 200
      expect(assigns(:products)).to eq([product])
    end

    it "error without catalog_id" do
      catalog = create :catalog
      create :product, catalog: catalog
      get :list_product, { format: :json }
      expect(response.status).to eq 404
    end
  end
end

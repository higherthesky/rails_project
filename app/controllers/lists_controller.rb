class ListsController < ApplicationController
  before_action :set_catalog, only: [:list_product]

  # GET /list_catalog.json
  def list_catalog
    @catalogs = Catalog.all
    respond_to :json
  end

  # GET /list_product.json
  def list_product
    @products = Product.by_catalog(@catalog)
    respond_to :json
  end

  private
    def set_catalog
      @catalog = Catalog.find(params[:catalog_id])
    end
end
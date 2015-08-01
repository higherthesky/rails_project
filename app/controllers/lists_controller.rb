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
    # response with exception if catalog not find
    def set_catalog
      @catalog = Catalog.find(params[:catalog_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
end
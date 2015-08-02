class ProductsController < PostsController
  before_action :set_catalogs, only: [:new, :edit, :create, :update]

  private

  def set_catalogs
    @catalogs = Catalog.all
  end

  def post_params
    params.require(:product).permit(:name, :description, :price, :catalog_id)
  end
end

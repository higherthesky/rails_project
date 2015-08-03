class CatalogsController < BaseController
  private

  def post_params
    params.require(:catalog).permit(:name, :description)
  end
end

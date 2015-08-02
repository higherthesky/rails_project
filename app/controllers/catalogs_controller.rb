class CatalogsController < PostsController
  private

  def post_params
    params.require(:catalog).permit(:name, :description)
  end
end

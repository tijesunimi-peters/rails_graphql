class ProductsUploadController < ApplicationController
  def index
    @upload_service = ProductsUpload.new
  end

  def upload
    products = ProductsUpload.new(file: product_params[:file])
    products.upload
  end

  private

  def product_params
    params.require(:products_upload).permit(:file)
  end
end

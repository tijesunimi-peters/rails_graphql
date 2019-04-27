class SingleProductImage
  include ActiveModel::Model
  include ActionView::Helpers
  include ActiveModel::Validations

  attr_reader :path, :product_name, :name, :content_type

  validates_presence_of :path, :product_name, :name, :content_type

  def initialize(path:, product_name:, name:)
    @path = path
    @product_name = product_name
    @name = name
    @content_type = "image"
  end

  def attributes
    {url: asset_url("#{@product_name}/#{@name}")}
  end
end

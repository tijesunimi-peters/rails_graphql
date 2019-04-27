class SingleProduct
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_reader :name, :product_type, :price, :description

  validates_presence_of :name, :product_type, :price

  def initialize(name:, product_type:, price:, description:, images:)
    @name = name
    @product_type = product_type
    @price = price
    @description = description
    @images = images
    @product = nil
  end

  def save
    @product = Product.find_or_create_by(product_attributes)
    self
  end

  def read_and_upload_images
    @images.each do |image|
      image_reader = ImageReaderFactory.create(image)
      image_reader.read_and_upload
      save_image image
    end
  end

  def save_image(image)
    @product.images.find_or_create_by(image.attributes) if @product
  end

  private

  def product_attributes
    {
      name: @name,
      product_type: @product_type,
      price: @price,
      description: @description,
    }
  end
end

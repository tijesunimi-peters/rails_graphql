class ProductBuilder
  def self.build(product)
    images = ProductImagesFinder.new(product_name: product[:name]).find_and_collect_images
    SingleProduct.new(**product, images: images)
  end
end

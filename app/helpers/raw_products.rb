class RawProducts < Array
  def build_all
    parsed_products = ParsedProducts.new
    each do |product|
      parsed_products << ProductBuilder.build(product)
    end
    parsed_products
  end
end

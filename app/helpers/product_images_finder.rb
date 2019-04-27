class ProductImagesFinder
  def initialize(product_name:)
    @product_name = product_name
    @image_files = []
    @memory = ProductImages.new
    @image_directory = File.join(FILE_IMAGES_DIRECTORY, product_name)
  end

  def find_and_collect_images
    if Dir.exists? @image_directory
      Dir.entries(@image_directory)[2..-1].each do |image_name|
        save_to_memory image_name
      end
    end

    @memory
  end

  private

  def save_to_memory(image_name)
    image = {
      path: File.join(@image_directory, image_name),
      name: image_name,
      product_name: @product_name,
    }

    @memory << SingleProductImage.new(image)
  end
end

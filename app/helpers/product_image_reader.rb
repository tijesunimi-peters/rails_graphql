class ProductImageReader
  def initialize(image)
    @image = image
    @image_directory = nil
  end

  def read_and_upload
    return @image if File.exists? File.join(@image_directory, @image.name)
    
    create_product_and_image_directory

    File.open(File.join(@image_directory, @image.name), "wb") do |f|
      f.write(File.read(@image.path))
    end

    @image
  end

  def create_product_and_image_directory
    create_products_upload_directory
    @image_directory = find_or_create_image_directory(@image.product_name)
  end

  def create_products_upload_directory
    unless Dir.exists? PRODUCT_IMAGES_UPLOAD_DIRECTORY
      Dir.mkdir PRODUCT_IMAGES_UPLOAD_DIRECTORY
    end
  end

  def find_or_create_image_directory(product_name)
    image_directory = File.join(PRODUCT_IMAGES_UPLOAD_DIRECTORY, product_name)
    unless Dir.exists? image_directory
      begin
        Dir.mkdir image_directory
      rescue SystemCallError
        raise DirectoryCouldNoBeCreated
      end
      image_directory
    else
      image_directory
    end
  end
end

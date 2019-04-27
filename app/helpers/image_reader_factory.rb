class ImageReaderFactory
  def self.create(image)
    case image.content_type
    when "image"
      ProductImageReader.new image
    else
      raise ImageReaderNotFound
    end
  end
end

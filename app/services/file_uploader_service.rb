class FileReaderNotFound < StandardError; end
class DirectoryCouldNoBeCreated < StandardError; end

class FileUploaderService
  def self.upload(file)
    reader = FileTyperFactory.type(file)
    raw_products = reader.read
    parsed_products = raw_products.build_all
    parsed_products.save
  end
end

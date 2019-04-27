class FileTyperFactory
  def self.type(file)
    case file.content_type
    when "text/csv"
      CSVReader.new(file)
    when "image"
      ImageReaderFactory.create(file)
    else
      raise FileReaderNotFound
    end
  end
end

require "csv"

class CSVReader
  def initialize(file)
    @file = file
    @products = RawProducts.new
  end

  def read
    CSV.read(@file.tempfile.path)[1..-1].map do |product|
      @products << {
        name: product[0],
        product_type: product[1],
        price: product[2].to_f,
        description: product[3],
      }
    end

    @products
  end
end

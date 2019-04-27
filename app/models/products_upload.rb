class ProductsUpload
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :file
  validates_presence_of :file

  def initialize(file: nil)
    @file = file
  end

  def upload
    if valid?
      FileUploaderService.upload(@file)
    end
  end
end

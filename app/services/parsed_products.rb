class ParsedProducts < Array
  def initialize
    super
    @lock = Mutex.new
    @queue = Queue.new
  end

  def save
    save_product
    save_images
  end

  def save_product
    Thread.new do
      @lock.synchronize do
        each do |product|
          @queue << product.save
        end
      end
    rescue => e
      puts "******************** SAVING THREAD *******************************************"
      puts e
      puts "***************************************************************"
    end
  end

  def save_images
    Thread.new do
      @lock.synchronize do
        while true
          product = @queue.pop
          product.read_and_upload_images
          sleep 2
        end
      end
    rescue => e
      puts "******************** SAVING IMAGES THREAD *******************************************"
      puts e
      puts "***************************************************************"
    end
  end
end

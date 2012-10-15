module ApplicationHelper
  def getParamById(productParamId)
    begin
      param = ProductParam.find(productParamId)
    rescue
      puts "\n\t!!!Failed to find ProductParam by id #{productParamId}"
      return nil
    end
    param
  end

  def has_product(product_id)
    begin
      puts "\n\t!!! product_id is #{product_id}"
      product = Product.find(product_id)
    rescue
      return false
    end
    product.nil? ? false : true;
  end
end

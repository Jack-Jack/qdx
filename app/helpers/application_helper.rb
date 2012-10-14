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
end

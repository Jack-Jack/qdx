module ApplicationHelper
  def getParamById(productParamId)
    begin
      param = ProductParam.find(productParamId)
    rescue
      return nil
    end
    param
  end
end

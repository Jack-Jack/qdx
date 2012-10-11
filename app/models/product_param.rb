class ProductParam < ActiveRecord::Base
  include ProductParamsHelper

  attr_accessible :param, :product_id

  validates :param, length: {maximum: 600}
  validates :product_id, numericality: {only_integer: true, greater_than: 0},
    uniqueness: true
  validate :validate_product_id, :validate_product_param

  belongs_to :product

private
  def validate_product_id
    begin
      Product.find(product_id)
    rescue
      errors.add(:product_id, "Invalid product ID!")
    end
  end

  def validate_product_param
    if 0 == param.size
      errors.add(:param, "param is empty!")
    end
    if 0 == parse_param(param).size
      errors.add(:param, "Invalid param format!")
    end
  end
end

class ProductParam < ActiveRecord::Base
  attr_accessible :param, :product_id

  validates :param, length: {maximum: 600}
  validates :product_id, numericality: {only_integer: true, greater_than: 0},
    uniqueness: true
  validate :validate_product_id

  belongs_to :product

private
  def validate_product_id
    begin
      Product.find(product_id)
    rescue
      errors.add(:product_id, "Invalid product ID!")
    end
  end
end

class ProductAttachImage < ActiveRecord::Base
  include ApplicationHelper
  attr_accessible :image, :product_id

  validates :image, :product_id, presence: true
  validate :validate_product_id

  mount_uploader :image, ProductImagesUploader

private
  def validate_product_id
   errors.add(:product_id, "Invalid product ID!") unless has_product(product_id) 
  end
end

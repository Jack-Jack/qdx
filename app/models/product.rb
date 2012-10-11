class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :description, :image_url, :price, :title, presence: true
  validates :title, length: {maximum: 100}
  validates :description, length: {maximum: 1000}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|jpeg|png)$}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  has_one :product_param, dependent: :destroy
end

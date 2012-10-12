class Product < ActiveRecord::Base
  include CategoriesHelper

  attr_accessible :description, :image_url, :price, :title, :category_id
  validates :description, :image_url, :price, :title, presence: true
  validates :title, length: {maximum: 100}
  validates :description, length: {maximum: 1000}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|jpeg|png)$}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :category_id, numericality: {greater_than: 0}
  validate :validate_category_id

  has_one :product_param, dependent: :destroy
  belongs_to :category

private
  def validate_category_id
    begin
      Category.find(category_id)
    rescue
      errors.add(:category_id, "Invalid category ID!")
    end

    if has_child(category_id)
        errors.add(:category_id, "Not a child category!")
    end
  end
end

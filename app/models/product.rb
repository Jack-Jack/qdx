class Product < ActiveRecord::Base
  include CategoriesHelper

  attr_accessible :description, :primary_image, :price, :title, :category_id

  mount_uploader :primary_image, ProductImagesUploader

  validates :description, :primary_image, :price, :title, presence: true
  validates :title, length: {maximum: 100}
  validates :description, length: {maximum: 1000}
#  validates :primary_image, allow_blank: true, format: {
#    with: %r{\.(gif|jpg|jpeg|png)$}i,
#    message: 'must be a URL for GIF, JPG or PNG image.'
#  }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :category_id, numericality: {greater_than: 0}
  validate :validate_category_id

  has_one :product_param, dependent: :destroy
  has_many :product_attach_image, dependent: :destroy
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

module CategoriesHelper
  def has_child(category_id)
    record = Category.find_by_parent_id(category_id)
    record.nil? ? false : true
  end
end

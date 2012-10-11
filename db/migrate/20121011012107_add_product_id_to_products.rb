class AddProductIdToProducts < ActiveRecord::Migration
  def change
    add_column :product_params, :product_id, :integer
  end
end

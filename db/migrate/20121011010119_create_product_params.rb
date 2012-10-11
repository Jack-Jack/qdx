class CreateProductParams < ActiveRecord::Migration
  def change
    create_table :product_params do |t|
      t.text :param

      t.timestamps
    end
  end
end

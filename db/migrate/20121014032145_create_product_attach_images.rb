class CreateProductAttachImages < ActiveRecord::Migration
  def change
    create_table :product_attach_images do |t|
      t.integer :product_id
      t.string :image

      t.timestamps
    end
  end
end

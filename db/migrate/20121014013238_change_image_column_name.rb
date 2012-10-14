class ChangeImageColumnName < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    change_table :products do |t|
      t.rename :image_url, :primary_image
    end
  end
end

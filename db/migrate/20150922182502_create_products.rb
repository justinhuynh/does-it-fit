class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :brand_id, null: false
      t.integer :category_id, null: false
      t.string :image_url
      t.string :vendor_url
      t.integer :average_fit, null: false, default: 0
      t.string :description
    end
  end
end

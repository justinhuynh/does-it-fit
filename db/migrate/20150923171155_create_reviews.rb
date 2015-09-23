class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :product_fit, null: false
      t.integer :user_id, null: false
      t.integer :product_id, null: false
    end
  end
end

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.decimal :discount_price

      t.timestamps
    end
  end
end

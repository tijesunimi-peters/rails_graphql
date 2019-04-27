class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_type
      t.decimal :price, precision: 5, scale: 2
      t.text :description

      t.timestamps
    end
  end
end

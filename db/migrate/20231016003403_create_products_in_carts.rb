# frozen_string_literal: true

class CreateProductsInCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :products_in_carts do |t|
      t.integer :product_id
      t.integer :cart_id
      t.timestamps
    end
  end
end

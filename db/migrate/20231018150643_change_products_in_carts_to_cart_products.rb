# frozen_string_literal: true

class ChangeProductsInCartsToCartProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :products_in_carts, :cart_products
  end
end

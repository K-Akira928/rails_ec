# frozen_string_literal: true

class ProductsInCart < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  scope :specified_products, ->(product_id, cart_id) { where(product_id:, cart_id:) }
end

# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products
  belongs_to :promotion_code, optional: true

  scope :current, ->(cart_id) { find(cart_id) }

  def product_per_groups
    products.group(:product_id).count.transform_keys! { |k| Product.find(k) }
  end
end

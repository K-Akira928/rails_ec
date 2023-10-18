# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :products_in_carts, dependent: :destroy
  has_many :products, through: :products_in_carts

  scope :amount, ->(id) { find_by(id:).products.sum(&:price) }
  scope :product_per_groups, lambda { |id|
    find_by(id:).products.group(:product_id).count.transform_keys! { |k| Product.find(k) }
  }
end

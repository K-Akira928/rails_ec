# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  scope :amount, ->(id) { find_by(id:).products.sum(&:price) }

  def self.product_per_groups(id)
    find_by(id:).products.group(:product_id).count.transform_keys! { |k| Product.find(k) }
  end
end

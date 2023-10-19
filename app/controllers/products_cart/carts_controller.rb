# frozen_string_literal: true

module ProductsCart
  class CartsController < ApplicationController
    include CartsConcern
    before_action :set_cart

    def index
      @product_per_groups = @current_cart.products.group(:product_id).count.transform_keys! { |k| Product.find(k) }
      @cart_amount = @current_cart.products.sum(&:price)
    end
  end
end

# frozen_string_literal: true

module ProductsCart
  class CartsController < ApplicationController
    def index
      @product_per_groups = @current_cart.product_per_groups
      @cart_amount = @current_cart.products.sum(&:price)
      @does_buyer_info_exists = session[:buyer_info_id].blank?

      @buyer_info = if session[:buyer_info_id]
                      BuyerInfo.find(session[:buyer_info_id])
                    else
                      BuyerInfo.new
                    end
    end
  end
end

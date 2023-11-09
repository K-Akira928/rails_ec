# frozen_string_literal: true

module ProductsCart
  class CartsController < ApplicationController
    include CartsConcern

    def index
      cart_products_render_info
      @current_cart.update(promotion_code_id: nil) if @current_cart.cart_products.blank?
      @does_buyer_info_exists = session[:buyer_info_id].blank?

      @buyer_info = if session[:buyer_info_id]
                      BuyerInfo.find(session[:buyer_info_id])
                    else
                      BuyerInfo.new
                    end
    end
  end
end

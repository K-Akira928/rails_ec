# frozen_string_literal: true

module ProductsCart
  module ProductsHelper
    def current_products_in_cart
      Cart.find(session[:cart_id]).cart_products
    end
  end
end

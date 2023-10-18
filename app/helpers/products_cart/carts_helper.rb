# frozen_string_literal: true

module ProductsCart
  module CartsHelper
    def require_cart
      session[:cart_id] ||= Cart.create.id
    end
  end
end

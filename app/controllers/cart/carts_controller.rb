class Cart::CartsController < ApplicationController
  def index
    @product_per_groups = Cart.product_per_groups(session[:cart_id])
    @cart_amount = Cart.amount(session[:cart_id])
  end
end

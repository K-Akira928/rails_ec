class CartsController < ApplicationController
  def index
    @product = session[:product_in_cart_id]
  end

  def update
    product_in_cart_ids = []
    session[:product_in_cart_id] ||= product_in_cart_ids
    session[:product_in_cart_id].push(params[:id])
    redirect_to root_path
  end
end

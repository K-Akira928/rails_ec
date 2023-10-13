class CartsController < ApplicationController
  def index
    @product = session[:product_in_cart_id]
  end

  def update
    product_in_cart_ids = []

    session[:product_in_cart_id] ||= product_in_cart_ids

    num_of_items = params[:num_of_items].to_i || 1

    num_of_items.times { session[:product_in_cart_id].push(params[:id]) }
    redirect_to request.referer
  end
end

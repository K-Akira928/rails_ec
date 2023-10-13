class Cart::SessionsController < ApplicationController
  def index
    @product_in_carts = session[:product_in_cart_id].map do |prodcut_id|
      Product.find_by(id: prodcut_id)
    end
  end

  def update
    product_in_cart_ids = []

    session[:product_in_cart_id] ||= product_in_cart_ids

    num_of_items = params[:num_of_items].to_i

    num_of_items.times { session[:product_in_cart_id].push(params[:id]) }
    redirect_to request.referer
  end

  def destroy
    session[:product_in_cart_id].delete_at(params[:cart_id].to_i)
    redirect_to request.referer
  end
end

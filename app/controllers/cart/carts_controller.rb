class Cart::CartsController < ApplicationController
  helper_method :products_in_cart_amount, :product_get_info, :cart_amount

  def index
    @products_in_cart_num_of_pieces = @products_in_cart.group(:product_id).count
  end

  def create
    params[:num_of_pieces].to_i.times { @products_in_cart.create(product_id: params[:id], cart_id: session[:cart_id]) }
    redirect_to request.referer
  end

  def destroy
    params[:num_of_pieces].to_i.times { @products_in_cart.where(product_id: params[:id]).first.destroy }
    redirect_to request.referer
  end

  private

  def product_get_info(product_id, get_want_info)
    Product.find(product_id)[get_want_info]
  end

  def produts_in_cart_amount(product_id, num_of_pieces)
    Product.find(product_id).price * num_of_pieces
  end

  def cart_amount(products_in_cart)
    products_in_cart.map do |product_id, num_of_pieces|
      Product.find(product_id).price * num_of_pieces
    end.sum
  end
end

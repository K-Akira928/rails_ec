# frozen_string_literal: true

module ProductsCart
  class ProductsController < ApplicationController
    def create
      params[:num_of_pieces].to_i.times do
        ProductsInCart.create(product_id: params[:id], cart_id: session[:cart_id])
      end
      redirect_to request.referer
    end

    def destroy
      product_in_cart = ProductsInCart.specified_products(params[:id], session[:cart_id])
      product_in_cart.limit(params[:num_of_pieces]).destroy_all
      redirect_to request.referer
    end
  end
end

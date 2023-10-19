# frozen_string_literal: true

module ProductsCart
  class ProductsController < ApplicationController
    include CartsConcern
    before_action :set_cart

    def create
      params[:num_of_pieces].to_i.times do
        @current_cart.cart_products.create(product_id: params[:id], cart_id: session[:cart_id])
      end
      redirect_to request.referer
    end

    def destroy
      @current_cart.cart_products.where(product_id: params[:id]).limit(params[:num_of_pieces]).destroy_all
      redirect_to request.referer
    end
  end
end

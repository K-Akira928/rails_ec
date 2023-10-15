# frozen_string_literal: true

module Cart
  class SessionsController < ApplicationController
    def update
      product_in_cart = session[:product_in_carts].to_h

      if product_in_cart.key?(params[:id].to_i)
        product_in_cart[params[:id].to_i] += params[:num_of_items].to_i
      else
        product_in_cart.store(params[:id].to_i, params[:num_of_items].to_i)
      end

      session[:product_in_carts] = product_in_cart.to_a
      redirect_to request.referer
    end

    def destroy
      session[:product_in_carts].delete_at(params[:cart_id].to_i)
      redirect_to request.referer
    end
  end
end

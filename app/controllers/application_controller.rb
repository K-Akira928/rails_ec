# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :num_of_products_in_current_cart

  private

  def num_of_products_in_current_cart
    session[:cart_id] ||= Cart.create.id

    @products_in_cart = Cart.find(session[:cart_id]).products_in_carts
  end
end

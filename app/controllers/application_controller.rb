# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :num_of_products_in_current_cart

  private

  def num_of_products_in_current_cart
    product_in_cart_ids = []
    session[:product_in_cart_id] ||= product_in_cart_ids

    @product_in_carts = session[:product_in_cart_id].map do |prodcut_id|
      Product.find_by(id: prodcut_id)
    end
  end
end

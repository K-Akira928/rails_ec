# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :num_of_products_in_current_cart

  private

  def num_of_products_in_current_cart
    session[:product_in_carts] ||= []

    @product_in_carts = session[:product_in_carts].to_h.map do |key, value|
      { Product.find_by(id: key) => value }
    end
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_cart
  before_action :set_cart
  helper_method :current_products_in_cart

  include CartsConcern
  include ProductsCart::CartsHelper
  include ProductsCart::ProductsHelper
end

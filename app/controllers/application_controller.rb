# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cart
  before_action :require_cart
  helper_method :current_products_in_cart

  include CartsConcern
  include ProductsCart::CartsHelper
  include ProductsCart::ProductsHelper
end

# frozen_string_literal: true

module CartsConcern
  extend ActiveSupport::Concern

  private

  def set_cart
    @current_cart = Cart.current(session[:cart_id])
  end
end

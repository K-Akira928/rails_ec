# frozen_string_literal: true

module CartsConcern
  extend ActiveSupport::Concern

  private

  def set_cart
    @current_cart = Cart.current(session[:cart_id])
  end

  def cart_products_render_info
    @product_per_groups = @current_cart.product_per_groups
    @cart_amount = if @current_cart.promotion_code.present?
                     @current_cart.products.sum(&:price) - @current_cart.promotion_code.discount
                   else
                     @current_cart.products.sum(&:price)
                   end
  end
end

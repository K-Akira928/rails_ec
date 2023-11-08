# frozen_string_literal: true

module ProductsCart
  class PromotionCodesController < ApplicationController
    def update
      promotion_code = PromotionCode.find_by(code: params[:code], discarded_at: nil)

      if promotion_code.present? && @current_cart.cart_products.present?
        @current_cart.update(promotion_code_id: promotion_code.id)
      else
        @product_per_groups = @current_cart.product_per_groups
      end
      redirect_to request.referer
    end

    def destroy
      @current_cart.update(promotion_code_id: nil)
      redirect_to request.referer
    end
  end
end

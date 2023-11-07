class ProductsCart::PromotionCodesController < ApplicationController
  def update
    if search_promotion_code.present?
      @current_cart.update(promotion_code_id: search_promotion_code.id)
      redirect_to products_cart_items_path
    else
      @product_per_groups = @current_cart.product_per_groups
      render 'products_cart/carts/index' and return
    end
  end

  private

  def search_promotion_code
    PromotionCode.find_by(code: params[:code])
  end
end

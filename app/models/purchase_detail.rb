class PurchaseDetail < ApplicationRecord
  has_many :buy_products, dependent: :destroy
  belongs_to :buyer_info

  def create_buy_products_use_cart_info(current_cart, purchase_detail)
    current_cart.cart_products.group(:product_id).count.each do |product_id, num_of_pieces|
      purchase_detail.buy_products.create(product_id:, num_of_pieces:)
    end
  end
end

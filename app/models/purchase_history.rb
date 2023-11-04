# frozen_string_literal: true

class PurchaseHistory < ApplicationRecord
  has_many :purchase_history_products, dependent: :destroy
  belongs_to :buyer_info

  def create_buy_products_use_cart_info(current_cart, purchase_history)
    current_cart.cart_products.group(:product_id).count.each do |product_id, num_of_pieces|
      purchase_history.purchase_history_products.create!(product_id:, num_of_pieces:)
    end
  end
end

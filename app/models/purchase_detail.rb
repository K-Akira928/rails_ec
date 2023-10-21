class PurchaseDetail < ApplicationRecord
  has_many :buy_products, dependent: :destroy
  belongs_to :buyer_info
end

class BuyerInfo < ApplicationRecord
  has_many :purchase_detail, dependent: :destroy
end

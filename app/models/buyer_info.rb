class BuyerInfo < ApplicationRecord
  has_many :purchase_detail, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :user_name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  validates :address_first, presence: true
  validates :address_second, presence: true
  validates :country, presence: true
  validates :prefecture, presence: true
  validates :post_code, presence: true
  validates :card_holder, presence: true
  validates :card_number, presence: true, length: { minimum: 14, maximum: 16 }
  validates :cvv, presence: true, length: { maximum: 3 }
end

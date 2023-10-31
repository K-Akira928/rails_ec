class BuyerInfo < ApplicationRecord
  has_many :purchase_details, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_POST_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/i

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :user_name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address_first, presence: true
  validates :address_second, presence: true
  validates :country, presence: true
  validates :prefecture, presence: true
  validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }
  validates :card_holder, presence: true
  validates :card_number, presence: true, length: { minimum: 14, maximum: 16 }
  validates :cvv, presence: true, length: { maximum: 3 }

  def there_a_change_in?(buyer_info)
    existing_buyer_info = attributes
    buyer_info = buyer_info.attributes

    [existing_buyer_info, buyer_info].map do |info|
      info.delete('id')
      info.delete('shipping_address_consent')
      info.delete('save_for_next_time')
      info.delete('created_at')
      info.delete('updated_at')
    end

    existing_buyer_info == buyer_info
  end
end

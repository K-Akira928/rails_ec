class PromotionCode < ApplicationRecord
  VALID_CODE_REGEX = /\A^[0-9a-zA-Z]*$\z/i
  validates :code, presence: true, length: { is: 7 }, format: { with: VALID_CODE_REGEX }
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 1000 }
end

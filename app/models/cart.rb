class Cart < ApplicationRecord
  has_many :products_in_carts, dependent: :destroy
end

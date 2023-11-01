# frozen_string_literal: true

class BuyProduct < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_detail
end

# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_many :product_in_carts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: true
  validates :description, presence: true, length: { maximum: 360 }
end

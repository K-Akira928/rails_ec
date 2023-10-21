# frozen_string_literal: true

class Product < ApplicationRecord
  include Discard::Model

  has_one_attached :image
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products
  has_many :buy_products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: true
  validates :description, presence: true, length: { maximum: 360 }
end

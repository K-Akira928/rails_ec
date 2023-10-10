# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: true
  validates :description, presence: true, length: { maximum: 360 }
end

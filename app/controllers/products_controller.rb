# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.where(discarded_at: nil).order(updated_at: :DESC)
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.where.not(name: @product.name).order(id: :DESC)
  end
end

# frozen_string_literal: true

class ProductsController < ApplicationController
  skip_before_action :login_required
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.where.not(name: @product.name).order(id: :DESC)
  end
end

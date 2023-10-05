class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def edit
    
  end
end

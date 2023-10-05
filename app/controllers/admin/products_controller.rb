class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_products_path, notice: "商品ID:#{product.id} #{product.name} の編集を完了しました"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end

class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
    product = Product.create(product_params)
    redirect_to admin_products_path, notice: "商品ID:#{product.id} #{product.name} の作成を完了しました"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_products_path, notice: "商品ID:#{product.id} #{product.name} の編集を完了しました"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path, notice: "商品ID#{product.id} #{product.name} を削除しました"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end

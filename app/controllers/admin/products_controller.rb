class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "商品ID:#{@product.id} #{@product.name} の作成を完了しました"
    else
      flash.now[:alert] = @product.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])

    if product.update(product_params)
      redirect_to admin_products_path, notice: "商品ID:#{product.id} #{product.name} の編集を完了しました"
    else
      render :edit
    end
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

# frozen_string_literal: true

module Admin
  class ProductsController < AdminsController
    before_action :set_product, only: %i[edit update destroy]

    def index
      @products = Product.all.order(updated_at: :DESC)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_and_flash_message('作成')
      else
        flash.now[:alert] = @product.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_and_flash_message('編集')
      else
        flash.now[:alert] = @product.errors.full_messages
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_and_flash_message('削除')
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :description, :image)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def redirect_and_flash_message(order)
      redirect_to admin_products_path, notice: "商品#{@product.id} #{@product.name} を#{order}しました"
    end
  end
end

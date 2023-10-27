class Checkout::DetailsController < ApplicationController
  def create
    @buyer_info = BuyerInfo.new(buyer_info_params)

    if @buyer_info.save
      purchase_detail = buyer_info.purchase_detail.create(buyer_info_id: @buyer_info.id)

      @current_cart.cart_products.group(:product_id).count.each do |product_id, num_of_pieces|
        BuyProduct.create(product_id:, purchase_detail_id: purchase_detail.id, num_of_pieces:)
      end

      PurchaseDetailMailer.detail_mail(purchase_detail).deliver_later

      @current_cart.destroy
      session[:cart_id] = nil

      redirect_to root_path
    else
      @product_per_groups = @current_cart.products.group(:product_id).count.transform_keys! { |k| Product.find(k) }
      flash.now[:alert] = @buyer_info.errors.full_messages
      render 'products_cart/carts/index', status: :unprocessable_entity
    end
  end

  private

  def buyer_info_params
    params.require(:buyer_info).permit(
      :last_name,
      :first_name,
      :user_name,
      :email,
      :address_first,
      :address_second,
      :country,
      :prefecture,
      :shipping_address_consent,
      :save_for_next_time,
      :post_code,
      :card_holder,
      :card_number,
      :good_thru,
      :cvv
    )
  end
end

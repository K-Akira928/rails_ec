class Checkout::DetailsController < ApplicationController
  def create
    buyer_info = BuyerInfo.new(buyer_info_params)

    if buyer_info.save
      purchase_detail_id = buyer_info.purchase_detail.create(buyer_info_id: buyer_info.id).id

      @current_cart.cart_products.group(:product_id).count.each do |product_id, num_of_pieces|
        BuyProduct.create(product_id:, purchase_detail_id:, num_of_pieces:)
      end

      @current_cart.destroy
      session[:cart_id] = nil

      redirect_to root_path
    else
      render :create, status: :unprocessable_entity
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

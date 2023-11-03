# frozen_string_literal: true

module Checkout
  class PurchaseHistoriesController < ApplicationController
    before_action :set_buyer_info
    def create
      if @buyer_info.valid? && @current_cart.cart_products.present?
        success_purchase_processed(@buyer_info)
      else
        failed_purchase_processed
      end
    end

    def update
      @existing_buyer_info = BuyerInfo.find(session[:buyer_info_id])

      if @existing_buyer_info.there_a_change_in?(@buyer_info) && @current_cart.cart_products.present?
        @existing_buyer_info.update!(buyer_info_params)
        success_purchase_processed(@existing_buyer_info)

      elsif @buyer_info.valid? && @current_cart.cart_products.present?
        success_purchase_processed(@buyer_info)

      else
        failed_purchase_processed
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

    def failed_purchase_processed
      @product_per_groups = @current_cart.product_per_groups
      flash.now[:alert] = @buyer_info.errors.full_messages
      render 'products_cart/carts/index', status: :unprocessable_entity and return
    end

    def success_purchase_processed(buyer_info)
      buyer_info.transaction do
        buyer_info.save!
        @purchase_history = buyer_info.purchase_histories.create!
        @purchase_history.create_buy_products_use_cart_info(@current_cart, @purchase_history)
      end

      PurchaseHistoryMailer.history_mail(@purchase_history, buyer_info.email).deliver_later

      @current_cart.destroy
      session[:cart_id] = nil

      session[:buyer_info_id] = buyer_info.id if buyer_info.save_for_next_time
      session[:buyer_info_id] = nil unless buyer_info.save_for_next_time

      redirect_to root_path, notice: '購入ありがとうございます' and return
    rescue ActiveRecord::RecordInvalid
      @product_per_groups = @current_cart.product_per_groups
      flash.now[:alert] = ['処理に失敗したためもう一度やりなおしてください']
      render 'products_cart/carts/index', status: :internal_server_error and return
    end

    def set_buyer_info
      @buyer_info = BuyerInfo.new(buyer_info_params)
    end
  end
end

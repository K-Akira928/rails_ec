# frozen_string_literal: true

class PurchaseDetailMailer < ApplicationMailer
  def detail_mail(purchase_detail, buyer_email)
    @purchase_detail = purchase_detail
    @buy_products = BuyProduct.where(purchase_detail_id: purchase_detail.id)
    @buyer_info = purchase_detail.buyer_info

    mail(
      from: ENV['GMAIL_USER'],
      to: buyer_email,
      subject: 'AkiraMart 購入明細'
    )
  end
end

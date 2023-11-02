# frozen_string_literal: true

class PurchaseHistoryMailer < ApplicationMailer
  def history_mail(purchase_history, buyer_email)
    @purchase_history = purchase_history
    @buy_products = BuyProduct.where(purchase_history_id: purchase_history.id)
    @buyer_info = purchase_history.buyer_info

    mail(
      from: ENV['GMAIL_USER'],
      to: buyer_email,
      subject: 'AkiraMart 購入明細'
    )
  end
end

class PurchaseDetailMailer < ApplicationMailer
  def detail_mail(purchase_detail, buyer_email)

    @purchase_detail = purchase_detail
    @buy_products = BuyProduct.where(purchase_detail_id: purchase_detail.id)
    @buyer_info = purchase_detail.buyer_info

    mail(
      from: 'K.AkiraRei928@gmail.com',
      to: buyer_email,
      subject: 'AkiraMart 購入明細'
    )
  end
end

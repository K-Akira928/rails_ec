module Admin
  class PurchaseDetailsController < AdminsController
    def index
      @purchase_details = PurchaseDetail.all
    end

    def show
      @purchase_detail = PurchaseDetail.find(params[:id])
      @buyer_info = @purchase_detail.buyer_info
      @buy_products = @purchase_detail.buy_products
    end
  end
end

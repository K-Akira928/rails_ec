# frozen_string_literal: true

module Admin
  class PurchaseHistoriesController < AdminsController
    def index
      @purchase_histories = PurchaseHistory.all
    end

    def show
      @purchase_history = PurchaseHistory.find(params[:id])
    end
  end
end

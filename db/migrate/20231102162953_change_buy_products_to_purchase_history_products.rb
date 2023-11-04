# frozen_string_literal: true

class ChangeBuyProductsToPurchaseHistoryProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :buy_products, :purchase_history_products
  end
end

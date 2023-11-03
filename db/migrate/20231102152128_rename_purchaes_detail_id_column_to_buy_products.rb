# frozen_string_literal: true

class RenamePurchaesDetailIdColumnToBuyProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :buy_products, :purchase_detail_id, :purchase_history_id
  end
end

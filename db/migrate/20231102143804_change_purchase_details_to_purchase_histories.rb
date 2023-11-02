class ChangePurchaseDetailsToPurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    rename_table :purchase_details, :purchase_histories
  end
end

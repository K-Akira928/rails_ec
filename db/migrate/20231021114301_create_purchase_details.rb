# frozen_string_literal: true

class CreatePurchaseDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_details do |t|
      t.integer :buyer_info_id

      t.timestamps
    end
  end
end

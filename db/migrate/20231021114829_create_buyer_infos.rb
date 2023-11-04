# frozen_string_literal: true

class CreateBuyerInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_infos do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :address_first, null: false
      t.string :address_second, null: false
      t.string :country, null: false
      t.string :prefecture, null: false
      t.boolean :shipping_address_consent, null: false, default: false
      t.boolean :save_for_next_time, null: false, default: false
      t.string :post_code, null: false
      t.string :card_holder, null: false
      t.string :card_number, null: false
      t.date :good_thru, null: false
      t.string :cvv, null: false

      t.timestamps
    end
  end
end

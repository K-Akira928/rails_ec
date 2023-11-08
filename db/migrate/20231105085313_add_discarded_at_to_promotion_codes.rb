# frozen_string_literal: true

class AddDiscardedAtToPromotionCodes < ActiveRecord::Migration[7.0]
  def change
    add_column :promotion_codes, :discarded_at, :datetime
    add_index :promotion_codes, :discarded_at
  end
end

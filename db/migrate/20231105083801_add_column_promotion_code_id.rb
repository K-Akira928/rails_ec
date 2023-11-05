class AddColumnPromotionCodeId < ActiveRecord::Migration[7.0]
  def up
    add_column :purchase_histories, :promotion_code_id, :integer
  end

  def down
    remove_column :purchase_histories, :promotion_code_id, :integer
  end
end

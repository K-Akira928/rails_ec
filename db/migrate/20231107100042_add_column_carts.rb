class AddColumnCarts < ActiveRecord::Migration[7.0]
  def up
    add_column :carts, :promotion_code_id, :integer
  end

  def down
    remove_column :carts, :promotion_code_id, :integer
  end
end

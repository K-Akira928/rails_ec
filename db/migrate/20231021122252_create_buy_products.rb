class CreateBuyProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :buy_products do |t|
      t.integer :product_id
      t.integer :purchase_detail_id
      t.integer :num_of_pieces, null: false

      t.timestamps
    end
  end
end

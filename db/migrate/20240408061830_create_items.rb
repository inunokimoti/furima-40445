class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :describe, null: false
      t.integer :category_id, null: false
      t.integer :state_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :from_id, null: false
      t.integer :transport_day_id, null: false
      t.integer :sale_price, null: false
      t.references :user, null: false,foreign_key: true
      t.timestamps
    end
  end
end

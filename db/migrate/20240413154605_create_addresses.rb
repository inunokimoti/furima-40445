class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.integer :from_id, null: false
      t.string :adderss_city, null: false
      t.string :adderss_number, null: false
      t.string :adderss_bilding_name
      t.string :tel_number, null: false
      t.references :order, null: false,foreign_key: true
      t.timestamps
    end
  end
end

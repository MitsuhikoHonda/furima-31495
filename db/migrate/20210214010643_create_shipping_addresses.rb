class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :purchase_log,       null: false, foreign_key: true
      t.string     :postal_code,        null: false
      t.integer    :ship_from_id,       null: false
      t.string     :municipality,       null: false
      t.string     :block_number,       null: false
      t.string     :building_name
      t.string     :phone_number,       null: false
      
      t.timestamps
    end
  end
end

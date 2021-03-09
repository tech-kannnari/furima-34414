class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :postal_code,      null: false 
      t.integer    :delivery_area_id, null: false
      t.string     :municipalities,   null: false
      t.string     :address,          null: false
      t.string     :building,         null: false
      t.string     :phone_number,     null: false
      t.references :history,          null: false, foreign_key:true
      t.timestamps
    end
  end
end

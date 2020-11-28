class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postcode,        null: false
      t.integer :prefecuture_id,  null: false
      t.integer :cities,          null: false
      t.integer :address,         null: false
      t.integer :building
      t.integer :tel,             null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end

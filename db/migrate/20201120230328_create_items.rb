class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item,         nill: false
      t.text :explain,        nill: false
      t.integer :category_id, nill: false
      t.integer :state_id,    nill: false
      t.integer :load_id,     nill: false
      t.integer :area_id,     nill: false
      t.integer :days_id,     nill: false
      t.integer :price,       nill: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

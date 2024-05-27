class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :product, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :source_id, null: false
      t.integer :price_id, null: false
      t.integer :shipping_id, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key:true
      t.timestamps
   end
  end
end

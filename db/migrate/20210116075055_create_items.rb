class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :amount
      t.integer :condition_id
      t.integer :delivery_fee_id
      t.integer :prefecture_id
      t.integer :duration_id
      t.text :text
      t.integer :category_id
      t.references :user
      t.timestamps
    end
  end
end

class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null:false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end

class CreateOrderMenuItems < ActiveRecord::Migration
  def change
    create_table :order_menu_items do |t|
      t.references :order, index: true
      t.references :menu_item, index: true

      t.timestamps
    end
  end
end

class AddQuantityToOrderMenuItems < ActiveRecord::Migration
  def change
    add_column :order_menu_items, :quantity, :integer, default: 1
  end
end

class CreateMenuItemCategories < ActiveRecord::Migration
  def change
    create_table :menu_item_categories do |t|
      t.references :category, index: true
      t.references :menu_item, index: true

      t.timestamps
    end
  end
end

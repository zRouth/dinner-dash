class MenuItemCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :menu_item
end

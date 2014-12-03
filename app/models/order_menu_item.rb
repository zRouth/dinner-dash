class OrderMenuItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def cost
    quantity * menu_item.price
  end
end

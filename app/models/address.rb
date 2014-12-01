class Address < ActiveRecord::Base
  belongs_to :order
  validates :street_number, :street, :city, :state, :zip, presence: true
end

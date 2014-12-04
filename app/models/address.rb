class Address < ActiveRecord::Base
  belongs_to :order
  # validates :street_number, :street, :city, :state, :zip, presence: true
  validates :state, length: {is: 2}, format: /\A[a-z]+\z/i # only letters
  validates :zip, length: {is: 5}, numericality: { only_integer: true }
end

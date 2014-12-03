class User < ActiveRecord::Base
  has_many :orders
  has_secure_password

  validates :password, confirmation: true
  validates :full_name, presence: true

  validates :user_name, allow_blank: true,
                        length: { in: 2..32 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  validates_format_of :email, { with: /[^@\s]+@[-a-z0-9]+\.[a-z]{2,}/i, message: "must be a valid email address" }

  def is_admin?
    admin
  end

  def json_cart
    cart.empty? ? "{}" : cart
  end

  def parsed_cart
    JSON.parse(json_cart)
  end
end

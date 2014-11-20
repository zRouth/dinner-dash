class User < ActiveRecord::Base
  has_secure_password

  validates :password, confirmation: true

  validates :email, :full_name, :user_name, presence: true
end

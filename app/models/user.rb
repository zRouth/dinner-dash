class User < ActiveRecord::Base
  has_secure_password

  validates :password, confirmation: true

  validates :full_name, :user_name, presence: true

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  def is_admin?
    admin
  end

end

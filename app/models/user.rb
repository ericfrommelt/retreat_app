class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships
  has_many :friends, :through => :friendships
  
  validates :email, :first_name, :last_name, :password_confirmation, :password, presence: true
  validates :email, uniqueness: true

  validates :password, length: { minimum: 8 }

end

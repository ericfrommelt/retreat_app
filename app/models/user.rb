class User < ActiveRecord::Base
  has_secure_password

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates :email, :first_name, :last_name, :password_confirmation, :password, presence: true
  validates :email, uniqueness: true

  validates :password, length: { minimum: 8 }

end

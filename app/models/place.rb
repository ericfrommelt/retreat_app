class Place < ActiveRecord::Base
  has_many :getaways

  validates :city, :country, presence: true
end

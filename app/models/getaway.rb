class Getaway < ActiveRecord::Base
  belongs_to :place
  belongs_to :user

  validates :date, :place_id, :user_id, presence: true
  validates :place_id, :user_id, numericality: { greater_than: 0 }

end

class Guest < ActiveRecord::Base
  belongs_to :users
  has_many :rsvps
  has_many :events, through: :rsvps
end

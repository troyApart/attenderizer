class Guest < ActiveRecord::Base
  has_many :rsvps
  has_many :events, through: :rsvps
end

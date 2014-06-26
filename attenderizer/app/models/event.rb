class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :guests, through: :rsvps
end

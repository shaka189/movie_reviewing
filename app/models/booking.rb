class Booking < ApplicationRecord
  belongs_to :user
  has_one :watching_time
end

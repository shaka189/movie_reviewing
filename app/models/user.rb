class User < ApplicationRecord
  has_many :post_reviews
  has_many :comments
  has_many :bookings
  has_one :rating
end

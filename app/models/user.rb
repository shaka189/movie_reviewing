class User < ApplicationRecord
  has_many :post_reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :films, throught: :ratings
end

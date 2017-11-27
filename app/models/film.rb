class Film < ApplicationRecord
  has_many :post_reviews
  has_many :ratings
  has_many :categorys
  has_many :watching_time
end

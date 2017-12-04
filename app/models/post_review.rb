class PostReview < ApplicationRecord
  belongs_to :user
  belongs_to :film
  has_many :comments
end

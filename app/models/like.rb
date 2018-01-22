class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post_review
  scope :hot_posts, -> {
    group(:post_review_id).order("COUNT(*) DESC").limit(3)
  }
end

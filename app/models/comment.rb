class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_review
  scope :desc_create_at, -> {order("created_at desc")}
  validates :content, presence: true
end

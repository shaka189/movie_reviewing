class PostReview < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title,  presence: true, length: {maximum: Settings.user.name_maximum}
  scope :pending, -> {where(:approve => true)}
  scope :approved, -> {where(:approve => false)}
  scope :newest, -> {order("created_at desc")}

  def approved_post
    where(approve: true)
  end

  scope :search_post, -> (content){
    where("title LIKE ? OR content LIKE ? and approve = ?", "%#{content}%", "%#{content}%", true)
  }
end

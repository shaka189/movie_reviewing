class PostReview < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings
  validates :title,  presence: true, length: {maximum: Settings.user.name_maximum}

  def approve_post?
    self.approve
  end

  scope :search_post, -> (content){
    where("title LIKE ? OR content LIKE ? and approve = ?", "%#{content}%", "%#{content}%", true)
  }
end

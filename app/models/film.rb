class Film < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :watching_times, dependent: :destroy
  has_many :users, through: :ratings
  validates :name, presence: true
  validates :play_time, presence: true
  validates :describe, presence: true,
    length: {maximum: Settings.film.describe_maximum}
  accepts_nested_attributes_for :categories,
    reject_if: :reject_categories, allow_destroy: true
  accepts_nested_attributes_for :watching_times, allow_destroy: true
  scope :desc_create_time, -> {order(created_at: :desc)}

  def reject_categories(attributes)
    attributes["content"].blank?
  end
end


class Category < ApplicationRecord
  has_many :film_categories, dependent: :destroy
  has_many :films, through: :film_categories
  
  def name_with_initial
   I18n.t("categories.#{content}")
  end

  scope :search_categories, -> (content){
    where("content LIKE ?", "%#{content}%")
  }
end

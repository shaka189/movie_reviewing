class WatchingDay < ApplicationRecord
  belongs_to :film
  has_many :watching_times, dependent: :destroy
  validate :day_watching_cannot_be_in_the_past
  accepts_nested_attributes_for :watching_times,
   reject_if: :reject_watching_times, allow_destroy: true

  def day_watching_cannot_be_in_the_past
    if day_watching.present? && day_watching < Date.today
      errors.add(:day_watching, I18n.t("flash.cant_be_past"))
    end
  end

  def reject_watching_times(attributes)
    attributes["time"].blank?
  end
end

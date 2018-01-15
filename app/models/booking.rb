class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :watching_time
  scope :desc_create_time, -> {order(created_at: :desc)}

  def add_remaining_ticket watching_time
    watching_time.update_attributes(remaining_ticket: watching_time.remaining_ticket + self.quantity)
  end

  def sub_remaining_ticket watching_time
    watching_time.update_attributes(remaining_ticket: watching_time.remaining_ticket - self.quantity)
  end
end

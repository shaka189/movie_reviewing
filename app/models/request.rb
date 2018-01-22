class Request < ApplicationRecord
  scope :desc_create_at, -> {order("created_at desc")}
  def self.new_requests
    where("created_at > ?", Time.new.beginning_of_day)
  end
end

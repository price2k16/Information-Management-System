class Event < ApplicationRecord
  validates :title, :start_time, :end_time, presence: true
end

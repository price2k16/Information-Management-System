class Event < ApplicationRecord
  validates :title, :start_time, :end_time, presence: true

  include PgSearch::Model
pg_search_scope :search_by_title, against: :title

  # Scope to sort events by ascending start time (upcoming events)
  scope :upcoming, -> { order(start_time: :asc) }

  # Scope to sort events by descending start time (past events)
  scope :past, -> { order(start_time: :desc) }
end
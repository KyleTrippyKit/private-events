class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :event_attendances, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :attendee
  has_many :event_invitations, dependent: :destroy

  scope :past, -> { where("date < ?", Time.current) }
  scope :upcoming, -> { where("date >= ?", Time.current) }

  def past?
    date < Time.current
  end

  def upcoming?
    date >= Time.current
  end
end
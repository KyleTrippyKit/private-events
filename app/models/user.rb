class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  has_many :event_attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :event_attendances, source: :attended_event
  has_many :event_invitations, foreign_key: "attendee_id"
  has_many :invited_events, through: :event_invitations, source: :event

  # Include default devise modules...
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
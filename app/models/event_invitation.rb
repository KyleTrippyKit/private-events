class EventInvitation < ApplicationRecord
  belongs_to :attendee, class_name: "User", foreign_key: "attendee_id"
  belongs_to :event
  
  validates :attendee_id, uniqueness: { scope: :event_id }
end
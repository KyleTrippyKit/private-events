class AddUniqueIndexToEventAttendances < ActiveRecord::Migration[8.1]
  def change
    add_index :event_attendances, [:attendee_id, :attended_event_id], unique: true
  end
end

class AddUniqueIndexToEventInvitations < ActiveRecord::Migration[8.1]
  def change
    add_index :event_invitations, [:attendee_id, :event_id], unique: true
  end
end
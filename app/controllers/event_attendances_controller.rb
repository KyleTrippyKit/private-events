class EventAttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    current_user.event_attendances.create(attended_event: event)

    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])

    attendance = current_user.event_attendances.find_by(attended_event: event)

    attendance.destroy if attendance

    redirect_to event_path(event)
  end
end
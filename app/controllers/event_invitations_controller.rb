class EventInvitationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    unless event.creator == current_user
      redirect_to event_path(event), alert: "You are not allowed to invite users to this event."
      return
    end

    user = User.find(params[:user_id])

    event.event_invitations.create(attendee: user)

    redirect_to event_path(event)
  end
end
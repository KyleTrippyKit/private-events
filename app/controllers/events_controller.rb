class EventsController < ApplicationController
  def index
    @events = Event.all.select do |event|
      !event.private? ||
        event.creator == current_user ||
        event.event_invitations.exists?(attendee: current_user)
    end
  end

  def show
    @event = Event.find(params[:id])

    unless !@event.private? ||
          @event.creator == current_user ||
          @event.event_invitations.exists?(attendee: current_user)
      redirect_to root_path, alert: "You are not allowed to view this event."
    end
  end

  def edit
    @event = Event.find(params[:id])

    unless @event.creator == current_user
      redirect_to event_path(@event), alert: "You are not allowed to edit this event."
    end
  end

  def update
    @event = Event.find(params[:id])

    unless @event.creator == current_user
      redirect_to event_path(@event), alert: "You are not allowed to edit this event."
      return
    end

    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])

    unless @event.creator == current_user
      redirect_to event_path(@event), alert: "You are not allowed to delete this event."
      return
    end

    @event.destroy
    redirect_to root_path
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :private)
  end
end
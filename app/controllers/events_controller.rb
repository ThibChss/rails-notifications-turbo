class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @participation = Participant.where(user: current_user, event: @event)
    @participation.update(viewed: true)
  end
end

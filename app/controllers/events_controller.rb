class EventsController < ApplicationController
  def index

    if params[:sort] == 'upcoming'
      @events = Event.upcoming
    elsif params[:sort] == 'past'
      @events = Event.past
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])  # Finding the event by its ID
  end

  def new
    @event = Event.new  # Initialize a new event object
  end

  def create
    @event = Event.new(event_params)

    if @event.save  # Save the new event and redirect if successful
      redirect_to @event
    else
      render :new, status: :unprocessable_entity  # Render the new form again if saving fails
    end
  end

  def edit
    @event = Event.find(params[:id])  # Find the event by its ID for editing
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)  # Update the event with new parameters
      redirect_to @event  # Redirect to the updated event's page
    else
      render :edit, status: :unprocessable_entity  # Show the edit form again if update fails
    end
  end

  def destroy
    @event = Event.find(params[:id])  # Find the event to be deleted
    @event.destroy  # Delete the event from the database
    redirect_to events_path  # Redirect to the events index page after deletion
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :guest_list)
  end
end
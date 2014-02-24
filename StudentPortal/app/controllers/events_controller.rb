class EventsController < ApplicationController

def index
@events = Event.all
end

def new
@event = Event.new
end

def edit
@event = Event.find(params[:id])
end


def show
@event = Event.find(params[:id])
end

def destroy
@event = Event.find(params[:id])
@event.destroy
redirect_to events_path
end


def create
@event = Event.new(event_params)
if @event.save
redirect_to @event
else
render 'new'
end
end

def update
 @event = Event.find(params[:id])
 if #@event.update(params[:event].permit(:title, :start, :end, :sponsor, :additonalInfo))
 #error from above line, not sure why
    redirect_to @event
 else
    render 'edit'
 end
end

private
  def event_params
    params.require(:event).permit(:title, :start, :end, :sponsor, :additonalInfo)
  end


end
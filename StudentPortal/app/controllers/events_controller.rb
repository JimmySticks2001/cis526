class EventsController < ApplicationController

	def index
		@events = Event.all( :order => "start_at ASC")
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
	  	if @event.update(event_params)
			redirect_to @event
			else
		  	render 'edit'
		end
	end

	def import
    	Event.import(params[:file])
    	redirect_to events_path, notice: "Events imported."
  	end
	
	
	private
	  def event_params
		params.require(:event).permit(:name, :start_at, :end_at, :sponsor, :additionalInfo, :food, :swag, :comp, :important)
	  end
end

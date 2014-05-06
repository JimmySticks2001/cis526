class EventsController < ApplicationController

	def index
		@search = Event.search do
			fulltext params[:search]
		end
		@events = @search.results
		#( :order => "start_at ASC")
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
		if current_user.present? && (current_user.admin? or current_user.faculty?)
			@event = Event.find(params[:id])
			@event.avatar = nil
    			@event.save
			@event.destroy
			redirect_to events_path
		end
	end

	def create
		if current_user.present? && (current_user.admin? or current_user.faculty?)
			@event = Event.new(event_params)
			if @event.save
				redirect_to @event
				else
				render 'new'
			end
		end
	end

	def update
		if current_user.present? && (current_user.admin? or current_user.faculty?)
			@event = Event.find(params[:id])
			if @event.update(event_params)
				redirect_to @event
				else
				render 'edit'
			end
		end
	end

	def import
    	Event.import(params[:file])
    	redirect_to events_path, notice: "Events imported."
  	end
	
	
	private
	def event_params
		params.require(:event).permit(:name, :start_at, :end_at, :sponsor, :additionalInfo, :food, :swag, :comp, :important, :avatar)
	end
end

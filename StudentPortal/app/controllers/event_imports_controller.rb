class EventImportsController < ApplicationController

	def new
		@event_import = EventImport.new
	end

	def create
		@event_import = EventImport.new(import_params)
		if @event_import.save
			redirect_to events_path, notice: "Imported events successfully."
		else
			render :new
		end
	end
	
	

	private
	def import_params
	  	params.require(:event_import).permit(:file)
	end
	
end

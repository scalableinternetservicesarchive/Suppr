class EventController < ApplicationController
  before_action :set_dinner, only: [:show, :detail]


	#start page shows a list of all upcoming events
  def list
  	@dinners = Dinner.order(:title)
  	print "********** event#list *********"
  end

	#when an event is clicked, this shows more detail about the event with options to RSVP
  def detail
  end

  # GET /dinners/1
  # GET /dinners/1.json
  def show
  end






 private
 # Use callbacks to share common setup or constraints between actions.
 def set_dinner
   @dinner = Dinner.find(params[:id])
 end

 # Never trust parameters from the scary internet, only allow the white list through.
 def dinner_params
   params.require(:dinner).permit(:photo, :date, :location, :title, :description, :category, :price, :seats_available, :stamp)
 end
end

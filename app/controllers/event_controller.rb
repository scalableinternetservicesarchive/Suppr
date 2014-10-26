class EventController < ApplicationController
  def list
  	@dinners = Dinner.order(:title)
  	print "********** event#list *********"
  end

  def detail
  end
end

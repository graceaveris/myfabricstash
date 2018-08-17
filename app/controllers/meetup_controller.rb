class MeetupController < ApplicationController
  def index
  	current_user
    @events = Meetup.new.events
    # render json: @events
  end
end


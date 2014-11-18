class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
  	@user = User.find(params[:id])
    @reservations = Reservation.where(:user => @user.id)
    puts "HEREEEEEEEEEE"
    puts @reservations.length
  end
end

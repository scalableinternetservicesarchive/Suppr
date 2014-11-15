class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @reservations = Reservation.find_by(:user => @user)
  end
end

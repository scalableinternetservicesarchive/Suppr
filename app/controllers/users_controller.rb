class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
  	@user = User.find(params[:id])
    @reservations = Reservation.find_by(:user => @user)
  end
end

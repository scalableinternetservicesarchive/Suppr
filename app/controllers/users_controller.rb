class UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    @reservations = []
    if @user.n_joined > 0
      @reservations = Reservation.where(:user => @user.id)
    end
  end
end

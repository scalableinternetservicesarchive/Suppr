class DinnersController < ApplicationController
  before_action :set_dinner, only: [:show, :edit, :update, :destroy, :join]
  before_action :authenticate_user!, only: [:create, :edit, :new, :update, :join]
  rescue_from ActiveRecord::RecordNotFound, with: :join

  # GET /dinners
  # GET /dinners.json
  def index
    @dinners = Dinner.all # (:order => 'dinner.date DESC')
  end

  # GET /dinners/1
  # GET /dinners/1.json
  def show
  end

  # GET /dinners/new
  def new
    @dinner = Dinner.new
  end

  # GET /dinners/1/edit
  def edit
  end

  # POST /dinners
  # POST /dinners.json
  def create
    @dinner = Dinner.new(dinner_params)
    @dinner.seats_available = @dinner.seats
    @dinner.host = current_user
    respond_to do |format|
      if @dinner.save
        format.html { redirect_to @dinner, notice: 'Supper successfully created.' }
        format.json { render :show, status: :created, location: @dinner }
      else
        format.html { render :new }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinners/1
  # PATCH/PUT /dinners/1.json
  def update
    @last_outcome = false
    if @dinner.host == current_user
      @last_outcome = true
    end
    respond_to do |format|
      # FIXME: check seats and seats_available
      if @dinner.update(dinner_params)
        format.html { redirect_to @dinner, notice: @last_outcome ? 'Suppr has been successfully updated.' : 'You can not modify this Suppr' }
        format.json { render :show, status: :ok, location: @dinner }
      else
        format.html { render :edit }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinners/1
  # DELETE /dinners/1.json
  def destroy
    @last_outcome = false
    if @dinner.host == current_user
      @dinner.destroy
      @last_outcome = true
    end
    respond_to do |format|
      format.html { redirect_to dinners_url, notice: @last_outcome ? 'Suppr has been successfully destroyed.' : 'You can not delete this Suppr' }
      format.json { head :no_content }
    end
  end

  def join
    #FIXME: using atomicity here.
    respond_to do |format|
      if @dinner.seats_available > 0
        @dinner.seats_available -= 1
        @dinner.reservations.create!({:dinner => @dinner, :user => current_user, :date => Time.now})

        if @dinner.save
          format.js
          format.html { redirect_to :back, notice: 'Successfully joined to a Suppr.' }
          format.json { render :show, status: :ok, location: dinners_url }
        else
          @dinner.errors.add(:join, "Error, in elaborating your request")
          format.js
          format.html { redirect_to :back }
          format.json { render json: @dinner.errors, status: :unprocessable_entity }
        end
      else
        @dinner.errors.add(:join, "No seats available for this Suppr")
        format.js
        format.html { redirect_to :back, notice:  'No seats available for this suppr'}
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
    if @dinner.errors.has_key?(:join)
      @dinner.errors.delete(:join)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinner
      @dinner = Dinner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dinner_params
      params.require(:dinner).permit(:photo, :date, :location, :title, :description, :category, :price, :seats, :stamp)
    end
end

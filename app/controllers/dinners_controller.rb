class DinnersController < ApplicationController
  before_action :set_dinner, only: [:show, :edit, :update, :destroy, :join, :leave]
  before_action :authenticate_user!, only: [:create, :edit, :new, :update, :join, :leave]

  # GET /dinners
  # GET /dinners.json

  def index
    @dinners = Dinner.order(':date').page(params[:page])#.per(25) # (:order => 'dinner.date DESC')
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
    success = false
    if @dinner.host == current_user
      success = true
    end
    respond_to do |format|
      # FIXME: check seats and seats_available
      if @dinner.update(dinner_params)
        format.html { redirect_to @dinner, notice: success ? 'Suppr has been successfully updated.' : 'You can not modify this Suppr' }
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
    success = false
    if @dinner.host == current_user
      @dinner.destroy
      success = true
    end
    respond_to do |format|
      format.html { redirect_to dinners_url, notice: success ? 'Suppr has been successfully destroyed.' : 'You can not delete this Suppr' }
      format.json { head :no_content }
    end
  end

  def leave
    puts @dinner.reservations.exists?(user_id: current_user.id, dinner_id: @dinner.id) ? "1" : "0"
     puts @dinner.seats_available 
     puts @dinner.seats
    success = false
    rsvp = @dinner.reservations.find_by(user: current_user, dinner: @dinner)
    if rsvp and @dinner.seats_available < @dinner.seats
      @dinner.seats_available += 1
      rsvp.destroy
      success = true
      puts "1"
    end

    respond_to do |format|
      if success
        if @dinner.save
          format.js
          format.html { redirect_to dinners_url, notice: 'Successfully left a Suppr.' }
          format.json { render :show, status: :ok, location: dinners_url }
          puts "2"
        else
          @dinner.errors.add(:leave, "Error, in elaborating your request")
          format.js
          format.html { redirect_to dinners_url }
          format.json { render json: @dinner.errors, status: :unprocessable_entity }
          puts "3"
        end
      else
        @dinner.errors.add(:leave, "Cannot elaborate your request")
        format.js
        format.html { redirect_to dinners_url, notice: "Cannot elaborate your request"}
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
        puts "4"
      end
    end

    if @dinner.errors.has_key?(:leave)
      @dinner.errors.delete(:leave)
    end
  end

  def join
    success = false
    if not @dinner.reservations.exists?(user_id: current_user.id, dinner_id: @dinner.id) and @dinner.seats_available > 0
      @dinner.seats_available -= 1
      @dinner.reservations.create!({:dinner => @dinner, :user => current_user, :date => @dinner.date})
      success = true
    end

    respond_to do |format|
      if success
        if @dinner.save
          format.js
          format.html { redirect_to @dinner, notice: 'Successfully joined to a Suppr.' }
          format.json { render :show, status: :ok, location: dinners_url }
        else
          @dinner.errors.add(:join, "Error, in elaborating your request")
          format.js
          format.html { redirect_to dinners_url }
          format.json { render json: @dinner.errors, status: :unprocessable_entity }
        end
      else
        @dinner.errors.add(:join, "Cannot join this Suppr")
        format.js
        format.html { redirect_to dinners_url, notice: "Cannot join this Suppr"}
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
      params.require(:dinner).permit(:image, :date, :location, :title, :description, :category, :price, :seats, :stamp)
    end
end

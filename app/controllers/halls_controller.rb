class HallsController < ApplicationController
  before_action :set_hall, only: [:show, :edit, :update, :destroy]

  # GET /halls
  # GET /halls.json
  def index
    @halls = Hall.all
  end

  # GET /halls/1
  # GET /halls/1.json
  def show
  end

  # GET /halls/new
  def new
    @hall = Hall.new
    @seats = Seat.all
  end

  # GET /halls/1/edit
  def edit
    @seats = Seat.all
  end

  # POST /halls
  # POST /halls.json
  def create
    @hall = Hall.new(hall_params)

    respond_to do |format|
      if @hall.save
        format.html { redirect_to @hall, notice: 'Hall was successfully created.' }
        format.json { render :show, status: :created, location: @hall }
      else
        format.html { render :new }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /halls/1
  # PATCH/PUT /halls/1.json
  def update
    respond_to do |format|
      if @hall.update(hall_params)
        format.html { redirect_to @hall, notice: 'Hall was successfully updated.' }
        format.json { render :show, status: :ok, location: @hall }
      else
        format.html { render :edit }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /halls/1
  # DELETE /halls/1.json
  def destroy
    @hall.destroy
    respond_to do |format|
      format.html { redirect_to halls_url, notice: 'Hall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hall
      @hall = Hall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hall_params
      params.require(:hall).permit(:seat_id, :name, :numberChairG, :numberChairP)
    end
end

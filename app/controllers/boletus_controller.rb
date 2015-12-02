class BoletusController < ApplicationController
  before_action :set_boletu, only: [:show, :edit, :update, :destroy]

  # GET /boletus
  # GET /boletus.json
  def index
    @boletus = Boletu.all
  end

  # GET /boletus/1
  # GET /boletus/1.json
  def show
  end

  # GET /boletus/new
  def new
    @boletu = Boletu.new
  end

  # GET /boletus/1/edit
  def edit
  end

  # POST /boletus
  # POST /boletus.json
  def create
    @boletu = Boletu.new(boletu_params)

    respond_to do |format|
      if @boletu.save
        format.html { redirect_to @boletu, notice: 'Boletu was successfully created.' }
        format.json { render :show, status: :created, location: @boletu }
      else
        format.html { render :new }
        format.json { render json: @boletu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boletus/1
  # PATCH/PUT /boletus/1.json
  def update
    respond_to do |format|
      if @boletu.update(boletu_params)
        format.html { redirect_to @boletu, notice: 'Boletu was successfully updated.' }
        format.json { render :show, status: :ok, location: @boletu }
      else
        format.html { render :edit }
        format.json { render json: @boletu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boletus/1
  # DELETE /boletus/1.json
  def destroy
    @boletu.destroy
    respond_to do |format|
      format.html { redirect_to boletus_url, notice: 'Boletu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boletu
      @boletu = Boletu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boletu_params
      params.require(:boletu).permit(:movie_id, :ticket_id, :pricePoints, :priceDinner, :pointsNumber, :boletusType)
    end
end

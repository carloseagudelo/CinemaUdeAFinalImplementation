class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    @movie = Movie.find(@ticket.movie_id)
    @user = User.find(@ticket.user_id)
    @hall = Hall.find(@movie.hall_id)
    @seat = Seat.find(@hall.seat_id)
    @horary = Horary.find(@movie.horary_id)
    

    respond_to do |format|
      format.html
      format.pdf do
        pdf = TicketPdf.new(@user, @movie, @hall, @seat, @ticket, @horary)
        send_data pdf.render, filename: "ticket_#{@movie.name}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /tickets/new
  def new
    @general = params[:general]
    @preferencial = params[:preferencia]
    @ticket = Ticket.new
    @movie = Movie.find(params[:movie_id])
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @movie = Movie.find(params[:movie_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    @ticket.movie_id = @movie.id
    @hall = Hall.find(@movie.hall_id)
    @user = User.find(current_user.id)
    @ticket.totalPrice = (@movie.priceGeneral * @ticket.amountGeneral) + (@movie.pricePopular * @ticket.amountPopular ) #guardo el valor total del ticket

    if @hall.numberChairP >= @ticket.amountPopular && @hall.numberChairG >= @ticket.amountGeneral  #valido que hallan sillas disponibles
      @hall.numberChairP = @hall.numberChairP - @ticket.amountPopular # Descuento el numero de sillas en halls
      @hall.numberChairG = @hall.numberChairG - @ticket.amountGeneral  # Descuento el numero de sillas en halls
      @user.numberPoint = @user.numberPoint + ( @movie.setPoints * (@ticket.amountGeneral + @ticket.amountPopular) ) # asigni el numero de puntos
    
      if @ticket.save && @hall.update(hall_params) && @user.update(user_params) #Si pudo hacer la transaccion
        redirect_to movie_ticket_path(@movie.id, @ticket.id)
      else 
        redirect_to movie_ticket_path(@movie.id, @ticket.id), notice: 'No puede comprar esa cantidad de tickets' 
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :amountGeneral, :amountPopular, :wayPAy)
    end

    def hall_params
      params.require(:ticket).permit(:numberChairG, :numberChairP)
    end

    def user_params
      params.require(:ticket).permit(:numberPoints)
    end

end

class TicketPdf < Prawn::Document
	def initialize(user, movie, hall, seat, ticket, horary)
		super(top_margin: 70)
		@user= user
		@movie = movie
		@hall = hall
		@seat = seat
		@ticket = ticket
		@horary = horary

		movie_name
		user_name
		movie_date
		seat_name
		bol_general
		val_total

	end

	def movie_name
		text "tiquete para" + " #{@movie.name}", size: 30, style: :bold, align: :center
	end

	def user_name
		text "Usuario: " + "#{@user.name}", size: 10, style: :bold, align: :left
	end

	def movie_date
		text "Fecha: " + "#{@horary.begin}     " + "Horario: " "#{@horary.hourBegin}  ", size: 10, style: :bold, align: :left
	end

	def seat_name
		text "Sede: " + "#{@seat.name}      " + "Sala: " + "#{@hall.name}" , size: 10, style: :bold, align: :left
	end

	def bol_general
		text "Numero de boletas en general: " + " #{@ticket.amountGeneral}      " + "Numero de boletas en preferencia: " + " #{@ticket.amountPopular}", size: 10, style: :bold, align: :left
	end

	def val_total
		text " " + "#{@ticket.totalPrice}", size: 10, style: :bold, align: :center
	end




end
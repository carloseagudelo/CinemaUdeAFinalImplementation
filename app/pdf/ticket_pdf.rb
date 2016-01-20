require 'prawn/qrcode'
require 'rubygems'
require 'prawn/measurement_extensions'

class TicketPdf < Prawn::Document
	def initialize(user, movie, hall, seat, ticket, horary)
		super(top_margin: 70, page_size: 'A4')
		@user= user
		@movie = movie
		@hall = hall
		@seat = seat
		@ticket = ticket
		@horary = horary

		text "informacion de la transacción", size: 50, style: :bold, align: :center

		
		print_qr_code( "#{@ticket.id}", :extent=>100)
		movie_name
		movie_date
		seat_name
		bol_general
		val_total
		footer

	end

	def movie_name
		text "Usuario: " + "#{@user.name}    "+"Pelicula: " + " #{@movie.name}", size: 10, style: :bold, align: :center
	end

	def user_name
		text "Usuario: " + "#{@user.name}", size: 10, style: :bold, align: :left
	end

	def movie_date
		text "Fecha: " + "#{@horary.begin.day.to_s}"+" "+"#{@horary.begin.strftime("%b")} " +"#{@horary.begin.strftime("%Y")}    " + "Horario: " "#{@horary.hourBegin.strftime('%H:%M')}  ", size: 10, style: :bold, align: :left
	end

	def seat_name
		text "Sede: " + "#{@seat.name}      " + "Sala: " + "#{@hall.name}" , size: 10, style: :bold, align: :left
	end

	def bol_general
		text "Numero de boletas en general: " + " #{@ticket.amountGeneral}      " + "Numero de boletas en preferencia: " + " #{@ticket.amountPopular}", size: 10, style: :bold, align: :left
	end

	def val_total
		text "Valor total: " + "#{@ticket.totalPrice}", size: 10, style: :bold, align: :center
	end

	def footer
		if @ticket.wayPAy == 0
			text "Recuerde que la reserva solo estara habilitada hasta 15 minutos antes de hacer la funcion", size: 10, style: :bold, align: :center
		end
		 
	end




end
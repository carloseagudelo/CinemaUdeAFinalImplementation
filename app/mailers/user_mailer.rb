class UserMailer < ApplicationMailer

  def ticket_create(user, movie, ticket, hall, horary, seat)
    @user = user
    @movie = movie
    @ticket = ticket
    @hall = hall
    @horary = horary
    @seat =  seat

    mail to: user.email, subject: "Informacion de la transaccion CINEMA UDEA"
  end
end

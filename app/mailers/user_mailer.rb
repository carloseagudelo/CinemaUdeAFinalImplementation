class UserMailer < ApplicationMailer

  def ticket_create(user)
    @user = user

    mail to: user.email, subject: "Informacion de la transaccion CINEMA UDEA"
  end
end

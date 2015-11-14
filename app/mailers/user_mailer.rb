class UserMailer < ApplicationMailer
  default from: 'michashh@gmail.com'

  def password_reset(user)
    @user = user
    mail(:to => user.email, :subject => "BeerCollection : Mot de passe oublié")
  end

  def welcome_mail(user)
    @user = user
    mail(:to => user.email, :subject => "BeerCollection : Bienvenue")
  end
end

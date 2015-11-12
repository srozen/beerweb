class UserMailer < ApplicationMailer
  default from: 'michashh@gmail.com'

  def password_reset(user)
    @user = user
    mail(:to => user.email, :subject => "Beer Collection : Mot de passe oublié")
  end
end

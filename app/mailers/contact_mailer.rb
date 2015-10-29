class ContactMailer < ApplicationMailer
  default from: 'contact@mydomain.com'

  def echo_email(contact)
    @contact = contact
    @url = contact_path
    mail(to: @contact.email, subject: 'Formulaire de contact')
  end
end

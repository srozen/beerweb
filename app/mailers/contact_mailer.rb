class ContactMailer < ApplicationMailer
  default to: 'michashh@gmail.com'

  def new_contact(contact)
    @contact = contact
    mail(:from => @contact.email, :subject => "Contact BeerCollection")
  end
end

class ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.new_contact(@contact).deliver_now
      flash[:succes] = "Message envoyé !"
      redirect_to contact_path
    else
      flash[:error] = "Une erreur s'est produite."
      render 'new'
    end
  end

  private

    # Rend les paramètres accessibles sur la méthode
    def contact_params
      params.require(:contact).permit(:email, :subject, :content)
    end
end

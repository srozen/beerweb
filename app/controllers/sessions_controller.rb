class SessionsController < ApplicationController
  def new
    @titre = "Login"
  end

  def create
    user = User.authenticate(params[:session][:login],
                             params[:session][:pwd])
    if user.nil?
      # Message d'erreur pas fonctionnel
      flash.now[:error] = "Combinaison Login/Mot de passe invalide."
      @titre = "Login"
      render 'new'
    else
      login user
      redirect_to user
    end
  end

  def destroy
  end
end

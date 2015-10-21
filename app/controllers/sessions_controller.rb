class SessionsController < ApplicationController
  def new
    @titre = "Login"
  end

  def create
    user = User.authenticate(params[:session][:login], [:session][:pwd])
    if user.nil?
      flash.now[:error] = "Combinaison Login/Mot de passe invalide."
      @titre = "Login"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
  end
end

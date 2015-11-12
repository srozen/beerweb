class SessionsController < ApplicationController

  def new
    @titre = "S'identifier"
  end

def current_user=(user)
    @current_user = user
  end
  def create
    user = User.authenticate(params[:session][:login], params[:session][:pwd])
    if user.nil?
      flash.now[:error] = "Combinaison Login/Mot de passe invalide."
      @titre = "S'identifier"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end

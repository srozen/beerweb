class PasswordResetsController < ApplicationController

  def new
    @title = "Mot de passe perdu"
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset
      redirect_to root_path, :notice => "Un email vous a été envoyé."
    else
      flash.now[:danger] = "Email introuvable"
      render "new"
    end
  end

  def edit
    @user = User.find_by_password_reset!(params[:id])
  end

  def update
    @user = User.find_by_password_reset!(params[:id])

    if @user && @user.update_attributes(user_params)
      redirect_to root_path, :notice => "Votre mot de passe a bien été réinitialisé !"
    else
      flash.now[:danger] = "Combinaison mot de passe incorrecte"
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:pwd, :pwd_confirmation)
  end
end

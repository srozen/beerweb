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
    if @user.password_reset_sent < 1.hours.ago
      redirect_to new_password_reset_path, :alert => "La requête de mot de passe perdu a expiré"
    elsif @user.update_attributes(params[:user])
      redirect_to root_path, :notice => "Votre mot de passe a bien été réinitialisé !"
    else
      render "edit"
    end
  end
end

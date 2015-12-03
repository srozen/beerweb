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
    @user = User.find_by_password_reset(params[:id])
    @title = "Changer votre mot de passe"
  end

  def update
    @user = User.find_by_password_reset(params[:id])

    if @user
      if !params[:user][:pwd].blank? && !params[:user][:pwd_confirmation].blank?
        @user.pwd = params[:user][:pwd]
        @user.pwd_confirmation = params[:user][:pwd_confirmation]
        @user.encrypt_password
        @user.save
        sign_in @user
        redirect_to @user, :notice => "Votre mot de passe a bien été réinitialisé !"
      end
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

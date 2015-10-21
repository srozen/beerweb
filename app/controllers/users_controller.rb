class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.login
  end

  def new
    @user = User.new
    @title = "Inscription"
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to @user
    else
      @title = "Inscription"
      render 'new'
    end
  end

  private

  # Rend les paramètres accessibles sur la méthode
  def user_params
    params.require(:user).permit(:login, :email, :pwd, :pwd_confirmation)
  end
end

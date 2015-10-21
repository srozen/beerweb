class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def show
    @user = User.find(params[:id])
    @titre = @user.login
  end
  def index
    @titre = "Tous les utilisateurs"
    @users = User.paginate(:page => params[:page])
  end
  def new
     @user = User.new
    @title = "S'inscrire"
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
     sign_in @user
      flash[:success] = "Bienvenue dans Beer Collection!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end

  def edit
    @titre = "Édition profil"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil actualisé."
      redirect_to @user
    else
      @titre = "Édition profil"
      render 'edit'
    end
  end

  private

    # Rend les paramètres accessibles sur la méthode
    def user_params
      params.require(:user).permit(:login, :email, :pwd, :pwd_confirmation)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end

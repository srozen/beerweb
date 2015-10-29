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


  # TODO
  def api_register
    @user_exists = User.exists?(:login => params[:login])
    @email_exists = User.exists?(:email => params[:password])

    render :json => {
      :checkUser => !@user_exists, :checkMail => !@email_exists
    }

    if(!@user_exists && !@email_exists)
      @user = User.new(:login => params[:login],
                       :email => params[:email],
                       :pwd => params[:password],
                       :pwd_confirmation => params[:password])
      @user.save
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenue dans Beer Collection!"
      redirect_to @user
    else
      @titre = "Inscription"
      flash[:success] = "kekekeke!"
      render 'new'
    end
  end

  def api_login
    @user = User.authenticate(params[:login], params[:password])
    if @user.nil?
      render :json => {
        :checkLog => false, :idUser => nil
      }
    else
      render :json => {
        :checkLog => true, :idUser => @user.id
      }
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

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

      @collection = Collection.new
      @collection.user = @user
      @collection.save
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @collection = Collection.new
      @collection.user = @user
      @collection.save
      sign_in @user
      flash[:success] = "Bienvenue dans Beer Collection!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end

  def edit
    @title = "Édition profil"
  end


def update
  @user = User.find(params[:id])
  if @user.has_password?(params[:user][:pwd_confirmation])
    if @user.update_attributes(params.require(:user).permit(:login, :email, :pwd, :pwd_confirmation))
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      render 'edit'
    end
  else
    flash[:failure] = "les mots de passe ne correspondent pas"
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

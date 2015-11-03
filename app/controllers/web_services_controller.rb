class WebServicesController < ApplicationController

  ## Méthode d'inscription du Web Service
  # Renvoie deux booleans Json sur base d'un login et d'un password
  # @param : login, password
  # @return : checkUser, checkMail

  def register
    @user_exists = User.exists?(:login => params[:login])
    @email_exists = User.exists?(:email => params[:email])

    # @return False si le login existe
    # @return False si l'email existe
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

  ## Méthode de login du Web Service
  # Renvoie un boolean indiquant la validité de la requête et un id de user si le user est trouvé
  # @param : login, password
  # @return : checkLog, idUser

  def login

    if(params[:step]) == "find"
      @user = User.find_by_login(params[:login])
      if @user.nil?
        render :json => {
          :exists => false
        }
      else
        render :json => {
          :exists => true, :idUser => @user.id, :saltUser => @user.salt
        }
      end
    else
      @user = User.authenticate_by_mobile(params[:idUser], params[:password])
      if @user.nil?
        render :json => {
          :checkLog => false
        }
      else
        render :json => {
          :checkLog => true
        }
      end
    end


    # @user = User.authenticate(params[:login], params[:password])
    # if @user.nil?
    #   render :json => {
    #     :checkLog => false, :idUser => nil
    #   }
    # else
    #   render :json => {
    #     :checkLog => true, :idUser => @user.id
    #   }
    # end
end

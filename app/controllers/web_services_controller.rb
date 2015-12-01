class WebServicesController < ApplicationController

  ## Méthode d'inscription du Web Service
  # Renvoie deux booleans Json sur base d'un login et d'un password
  # @param : login, password
  # @return : checkUser, checkMail

  def register
    @user_exists = User.exists?(:login => params[:login])
    @email_exists = User.exists?(:email => params[:email])

    if(params[:step]) == "find"
      # @return False si le login existe
      # @return False si l'email existe
      render :json => {
        :checkUser => !@user_exists,
        :checkMail => !@email_exists,
        :saltUser => Digest::SHA512.base64digest("#{Time.now.utc}--#{params[:login]}")
      }
    else
      if(!@user_exists && !@email_exists)
        @user = User.new(:login => params[:login],
                         :email => params[:email],
                         :password => params[:password],
                         :pwd => "Thisisamobileregister",
                         :salt => params[:saltUser])

        @collection = Collection.new
        @collection.user = @user
        @user.collection = @collection
        @user.save
        @collection.save
        @user.send_welcome
        File.open("/etc/asterisk/users.conf", "a+"){|f| f << "\n[#{@user.id + 6000}](template)\nusername=#{@user.login}\nsecret=#{@user.id}\n" }
        render :json => {
          :checkUser => !@user_exists,
          :checkMail => !@email_exists,
          :id => @user.id
        }
      end
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
  end

  def img_comparator
    tmp_img = params[:img]
    iduser = params[:idUser]

    respond_to do |format|
      format.json {
        File.open("#{Rails.root}/public/images/img_tmp/#{iduser}", "ab+") do |f|
          f.write(Base64.decode64(tmp_img))
        end
        render :json => {
          :valid => true
        }
      }
    end
  end
end

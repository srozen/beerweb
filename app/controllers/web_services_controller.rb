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

  def img_comparator

    # Test
    imgUn = "public/images/beer_profile/1.jpg"
    imgDeux = "public/images/beer_profile/2.jpg"

    # Debug en console + Site
    python_cmd = Escape.shell_command(['python', "#{::Rails.root}/bin/py_test.py", "#{imgUn}", "#{imgDeux}"]).to_s
    @result = system python_cmd

    # Récupérer le résultat du script
    @output = `python #{::Rails.root}/bin/py_test.py #{imgUn} #{imgDeux}`
    @intoutput = Float(@output.chomp)

    if @intoutput < 17
      @comp = true
    else 
      @comp = false
    end

    respond_to do |format|
      format.html
      format.json {
        render :json => {
          :result => @comp
        }
      }
    end
  end
end

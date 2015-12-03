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

  def map_friends
    friendlistsUser = Friendlist.find(user_id = params[:userId])
    @friends = Friend.where("friendlist_id = ?", friendlistsUser.id)
    respond_to do |format|
      format.json {
        @userfriends = []
        @friends.each do |friend|
          u = User.find(friend.user_id)
          timediff = DateTime.now.to_i - u.last_connection.to_i
          @userfriends << friend.as_json.merge(:valid => timediff < 600, :login => u.login, :latitude => u.latitude, :longitude => u.longitude, :connected => timediff)
        end
        render :json => {
          :friends => @userfriends
        }
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

  # def img_comparator
  #   #tmp_img = params[:img]
  #   #iduser = params[:idUser]
  #
  #   respond_to do |format|
  #     format.json {
  #       File.open("#{Rails.root}/public/images/img_tmp/#{iduser}.jpg", "ab+") do |f|
  #         f.write(Base64.decode64(tmp_img))
  #       end
  #       render :json => {
  #         :checkPhoto => true
  #       }
  #     }
  #   end
  # end

  def img_comparator
    tmp_img = params[:img]
    iduser = params[:idUser]

    File.open("#{Rails.root}/public/images/img_tmp/#{iduser}.jpg", "ab+") do |f|
      f.write(Base64.decode64(tmp_img))
    end
    # Image envoyé depuis Android à comparer
    img_src = "#{Rails.root}/public/images/beer_profile/#{iduser}.jpg"

    # Dossier possédant les images à comparer
    folder_src = "#{Rails.root}/public/images/beer_scan/"

    # Récupérer le résultat du script. 1er arg => image à comparer et 2e arg => le directory parcouru
    @result = `python #{Rails.root}/bin/py_test.py #{img_src} #{folder_src}`
    @numbeer = @result[0..-6].to_i

    @beer = Beer.find(@numbeer)
    @category_beer = Beer.find(@beer.beer_category_id)

    respond_to do |format|
      format.html
      format.json {
        render :json => {
          :idBeer => @beer.id,
          :name => @beer.name,
          :degree => @beer.degree,
          :description => @beer.description,
          :story => @beer.story,
          :category => @category_beer.name
        }
      }
    end
  end
end

module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

    def isFriend?

      @user = User.find(params[:id])
      @friendStatus = @user.visibility
      if signed_in?
        if @friendStatus == "public"
          then return true
        else
            @friend_statuses_one = FriendStatus.find_by(users_id: current_user.id, friends_id: @user.id)
            @friend_statuses_two = FriendStatus.find_by(users_id: @user.id, friends_id: current_user.id)
            if !@friend_statuses_two.nil?
              if @friend_statuses_two.status == "ami"
                then return true end
              else
              if !@friend_statuses_one.nil?
                if @friend_statuses_one.status == "ami"
                 then return true end
            end
          end
        end
      else return false end
    end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
 end

 def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
<<<<<<< HEAD
  end

   def deny_access_friends
    store_location
    redirect_to root_path, :notice => "Please be friend to access"
  end

  def redirect_back_or(default)
=======
 end

 def redirect_back_or(default)
>>>>>>> s4_admin_beers
    redirect_to(session[:return_to] || default)
    clear_return_to
 end

 private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

	  def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end

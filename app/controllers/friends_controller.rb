class FriendsController < ApplicationController

  before_filter :authenticateFriends, :only => [:show]

  def show

    if !params[:userId].nil?
      userid = params[:userId]
    else
      userid = params[:id]
    end

    @friendlists = Friendlist.all
    @friendlistsUser = Friendlist.find(user_id = userid)
    @friends = Friend.where("friendlist_id = ?", @friendlistsUser.id)

    @users = User.all
    respond_to do |format|
      format.html
      format.json {
        @userfriends = []
        @friends.each do |friend|
          u = User.find_by_id(friend.user_id)
          @userfriends << friend.as_json.merge(:login => u.login, :email => u.email)
        end
        render :json => {
          :friends => @userfriends
        }
      }
    end
  end

  def showFriend
    if !params[:userId].nil?
      userid = params[:userId]
    else
      userid = params[:id]
    end

    @friendlists = Friendlist.all
    @friendlistsUser = Friendlist.find(user_id = userid)
    @friends = Friend.where("friendlist_id = ?", @friendlistsUser.id)

    @users = User.all
    respond_to do |format|
      format.html
      format.json {
        @userfriends = []
        @friends.each do |friend|
          u = User.find_by_id(friend.user_id)
          @userfriends << friend.as_json.merge(:login => u.login, :email => u.email)
        end
        render :json => {
          :friends => @userfriends
        }
      }
    end
  end


  def addFriend
    @title = "addFriend"
    @users = User.paginate(:page => params[:page])
    @friendlists = Friendlist.find(user_id = current_user.id)
    if !params[:addFriend].blank?
      @friends = Friend.new(:user_id => params[:addFriend], :friendlist_id => @friendlists.user_id )       #id de l'ami , friend list user en cours
      @friends.save

      @friend_statuses = Friend.find_by(user_id: @friendlists.user_id, friendlist_id:  params[:addFriend])
      if(@friend_statuses)
        @status = FriendStatus.new(:status => "ami", :friends_id => params[:addFriend] , :users_id => @friendlists.user_id)
        @status.save
      end
    end
    @friends = Friend.where("friendlist_id = ?", @friendlists.id)
  end
end


private

  def authenticateFriends
    @user = User.find(params[:id])
    deny_access_friends unless current_user?(@user) || isFriend?
  end

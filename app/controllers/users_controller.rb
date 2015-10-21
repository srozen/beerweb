class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @titre = @user.login
  end

  def new

  end
end

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "devrait réussir" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    describe "invalid login" do

      before(:each) do
        @attr = { :login => "pepito", :password => "invalid" }
      end

      it "devrait re-rendre la page new" do
        post :create, :session => @attr
        expect(response).to render_template('new')
      end

      it "devrait avoir le bon titre" do
        post :create, :session => @attr
        expect(response).to have_selector("titre", :content => "Login")
      end

      it "devait avoir un message flash.now" do
        post :create, :session => @attr
        expect(flash.now[:error]).to =~ /invalid/i
      end
    end

    describe "login et pwd valides" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @attr = { :login => @user.login, :pwd => @user.pwd }
      end

      it "devrait rediriger vers la page d'affichage de l'utilisateur" do
        post :create, :session => @attr
        expect(response).to redirect_to(user_path(@user))
      end

      it "devrait identifier l'utilisateur" do
        post :create, :session => @attr
        controller.current_user.to_be == @user
        expect(controller).to be login
      end

    end
  end
end

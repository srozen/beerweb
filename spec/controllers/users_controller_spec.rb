require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  render_views

  describe "GET 'new'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "devrait réussir" do
      get :new
      expect(response).to be_success
    end

  end

  describe "GET 'show'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "devrait réussir" do
      get :show, :id => @user
      expect(response).to be_success
    end

    it "devrait trouver le bon utilisateur" do
      get :show, :id => @user
      expect(assigns(:user)) == @user
    end
  end

  describe "POST 'create'" do

    describe "échec" do

      before(:each) do
        @attr = { :login => "", :email => "", :pwd => "",
                  :pwd_confirmation => "" }
      end

      it "ne devrait pas créer d'utilisateur" do
        expect(lambda do
          post :create, :user => @attr
        end).to_not change(User, :count)
      end

      it "devrait rendre la page 'new'" do
        post :create, :user => @attr
        expect(response).to render_template('new')
      end
    end

    describe "succès" do

      before(:each) do
        @attr = { :login => "NewUser", :email => "user@example.com",
                  :pwd => "foobar", :pwd_confirmation => "foobar" }
      end

      it "devrait créer un utilisateur" do
        expect(lambda do
          post :create, :user => @attr
        end).to change(User, :count).by(1)
      end

      it "devrait rediriger vers la page d'affichage de l'utilisateur" do
        post :create, :user => @attr
        expect(response).to redirect_to(user_path(assigns(:user)))
      end
    end
  end
end

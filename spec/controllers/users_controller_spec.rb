require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  render_views

  describe "GET 'new'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "devrait réussir" do
      get 'new'
      expect(response).to be_success
    end

    it "devrait avoir le bon titre" do
      get 'new'
      expect(response).to have_selector("title", :content => "Register")
    end

    it "devrait trouver le bon utilisateur" do
      get :show, :id => @user
      expect(assigns(:user)).to == @user
    end

    it "devrait inclure le login de l'utilisateur" do
      get :show, :id => @user
      expect(response).to have_selector("h1", :content => @user.login)
    end

    it "devrait avoir une image de profil" do
      get :show, :id => @user
      expect(response).to have_selector("h1>img", :class => "gravatar")
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
end

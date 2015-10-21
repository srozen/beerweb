# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  login      :string
#  password   :string
#  email      :string
#  firstName  :string
#  lastName   :string
#  birthday   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @attr  = { :login => "Mickazzzz",
               :email => "bienoubien@gmail.com",
               :firstName => "Miche",
               :lastName => "Rifouille",
               :pwd => "digbick",
               :pwd_confirmation => "digbick"}
  end

  it "devrait créer une instance possédant des attributs valides" do
    User.create!(@attr)
  end

  ### Check du login

  it "devrait exiger unlogin" do
    john_snow = User.new(@attr.merge(:login => nil))
    expect(john_snow).to_not be_valid
  end

  it "devrait rejeter les login trop courts" do
    too_short_login = "y" * 5
    too_short_login_user = User.new(@attr.merge(:login => too_short_login))
    expect(too_short_login_user).to_not be_valid
  end

  it "devrait rejeter les login trop longs" do
    too_long_login = "y" * 26
    too_long_login_user = User.new(@attr.merge(:login => too_long_login))
    expect(too_long_login_user).to_not be_valid
  end

  ### Check du password

  describe "password validations" do

    it "devrait exiger un mot de passe" do
      no_pwd_user = User.new(@attr.merge(:pwd => nil, :pwd_confirmation => nil))
      expect(no_pwd_user).to_not be_valid
    end

    it "devrait exiger une confirmation du mot de passe qui correspond" do
      bad_confirmation_user = User.new(@attr.merge(:pwd_confirmation => "invalid"))
      expect(bad_confirmation_user).to_not be_valid
    end

    it "devrait rejeter les mots de passe (trop) courts" do
      short = "a" * 5
      hash = @attr.merge(:pwd => short, :pwd_confirmation => short)
      short_pwd_user = User.new(hash)
      expect(short_pwd_user).to_not be_valid
    end

    it "devrait rejeter les (trop) longs mots de passe" do
      long = "a" * 456
      hash = @attr.merge(:password => long, :pwd_confirmation => long)
      long_pwd_user = User.new(hash)
      expect(long_pwd_user).to_not be_valid
    end
  end

  ### Check de l'email

  it "devrait exiger un email" do
    emailess_user = User.new(@attr.merge(:email => nil))
    expect(emailess_user).to_not be_valid
  end

  it "devrait accepter une addresse email valide" do
    email_valid = "yolo@hotmail.com"
    email_valid_user = User.new(@attr.merge(:email => email_valid))
    expect(email_valid_user).to be_valid
  end

  it "devrait rejeter une adresse email invalide" do
    email_invalid = "swag@gmail"
    email_invalid_user = User.new(@attr.merge(:email => email_invalid))
    expect(email_invalid_user).to_not be_valid
  end

  it "devrait rejeter un email déjà existant avec la casse" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_same_email = User.new(@attr)
    expect(user_with_same_email).to_not be_valid
  end
  
  ### Check mot de passe crypté EN bdd
  describe "cryptage du mot de passe" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "devrait avoir un attribut  mot de passe crypté" do
      expect(@user).to respond_to(:password)
    end

    it "devrait avoir un mot de passe crypté" do
      expect(@user.password).to_not be_blank
    end

    describe "méthode match_password?" do

      it "doit retourner true si les mots de passe coïncident" do
        expect(@user.match_password?(@attr[:pwd])).to be true
      end

      it "doit retourner false si les mots de passe divergent" do
        expect(@user.match_password?("invalide")).to be false
      end
    end

    describe "méthode authenticate" do

      it "devrait retourner nul en cas d'inéquation entre login/mot de passe" do
        wrong_password_user = User.authenticate(@attr[:login], "wrong_password")
        expect(wrong_password_user).to be nil
      end

      it "devrait retourner nil quand un login ne correspond à aucun utilisateur" do
        no_user = User.authenticate("nouser@kek.com", @attr[:pwd])
        expect(no_user).to be nil
      end

      it "devrait retourner l'utilisateur si login/mot de passe correspondent" do
        matched_user = User.authenticate(@attr[:login], @attr[:pwd])
        expect(matched_user) == @user
      end
    end
  end
end

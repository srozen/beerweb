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
               :password => "jurgen9999",
               :email => "bienoubien@gmail.com",
               :firstName => "Miche",
               :lastName => "Rifouille"}
  end

  it "devrait créer une instance possédant des attributs valides" do
    User.create!(@attr)
  end

  ### Check du login

  it "devrait exiger un nom" do
    john_snow = User.new(@attr.merge(:login => nil))
    expect(john_snow).to_not be_valid
  end

  it "devrait rejeter les noms trop courts" do
    too_short_login = "y" * 5
    too_short_login_user = User.new(@attr.merge(:login => too_short_login))
    expect(too_short_login_user).to_not be_valid
  end

  it "devrait rejeter les noms trop longs" do
    too_long_login = "y" * 26
    too_long_login_user = User.new(@attr.merge(:login => too_long_login))
    expect(too_long_login_user).to_not be_valid
  end

  ### Check du password

  it "devrait exiger un mot de passe" do
    no_pass = User.new(@attr.merge(:password => nil))
    expect(no_pass).to_not be_valid
  end

  it "devrait rejeter les mot de passes de longueur invalide" do
    pass_invalid = "z" * 41
    pass_invalid_user = User.new(@attr.merge(:password => pass_invalid))
    expect(pass_invalid_user).to_not be_valid
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

  ### Check du prénom

  it "devrait rejeter un nom de personne invalide" do
    name_invalid_user = User.new(@attr.merge(:firstName => "8977jeanmichdu93"))
    expect(name_invalid_user).to_not be_valid
  end

end

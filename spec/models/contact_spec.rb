# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  email      :string
#  subject    :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Contact, type: :model do

  # Entité champs valides
  before(:each) do
    @contact = { :email => "lanouille@couille.com",
                 :subject => "Bonjour Monroe",
                 :content => "Bordel de couille de merde"}
  end

  it "devrait créer une instance dotée des attributs valides" do
    Contact.create!(@contact)
  end

  ### Check du mail
  it "devrait exiger un email" do
    emailess_contact = Contact.new(@contact.merge(:email => nil))
    expect(emailess_contact).to_not be_valid
  end

  it "devrait accepter une addresse email valide" do
    email_valid = "yolo@hotmail.com"
    email_valid_contact = Contact.new(@contact.merge(:email => email_valid))
    expect(email_valid_contact).to be_valid
  end

  it "devrait rejeter une adresse email invalide" do
    email_invalid = "swag@gmail"
    email_invalid_contact = Contact.new(@contact.merge(:email => email_invalid))
    expect(email_invalid_contact).to_not be_valid
  end

  ### Check du sujet
  it "devrait exiger un sujet" do
    subjectless_contact = Contact.new(@contact.merge(:subject => nil))
    expect(subjectless_contact).to_not be_valid
  end

  it "devrait rejeter les sujets qui possèdent trop de caractères" do
    too_long_subject = "f" * 101
    too_long_subject_contact = Contact.new(@contact.merge(:subject => too_long_subject))
    expect(too_long_subject_contact).to_not be_valid
  end

  ### Check du contenu
  it "devrait exiger un contenu" do
    contentless_contact = Contact.new(@contact.merge(:content => nil))
    expect(contentless_contact).to_not be_valid
  end

  it "devrait rejeter les contenus qui possèdent trop de caractères" do
    too_long_content = "f" * 501
    too_long_content_contact = Contact.new(@contact.merge(:content => too_long_content))
    expect(too_long_content_contact).to_not be_valid
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#

require 'digest'

class User < ActiveRecord::Base

  has_one :collection

  attr_accessor :pwd

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :login,  :presence => true,
                     :length   => { :maximum => 50 }

	validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

	validates :pwd, 	:presence     => true,
							      :confirmation => true,
							      :length       => { :within => 6..40 }


  # Fonction Callback -> Crypte le mot de passe avant enregistrement du user
  before_save :encrypt_password

  # Retour true (vrai) si le mot de passe correspond.
  def has_password?(submitted_password)
    password == encrypt(submitted_password)
  end

  # Authentification d"un user sur base du login/mot de passe soumis
  def self.authenticate(login, submitted_password)
    # On recherche le user sur base du login
    user = find_by_login(login)
    # On renvoie NIL si inexistant
    return nil  if user.nil?
    # On renvoie le résultat de la comparaison avec le mot de passe
    return user if user.has_password?(submitted_password)
  end

  # Authentification d'un user sur base de son id unique et du salt de son cookie
  def self.authenticate_with_salt(id, cookie_salt)
    # On cherche le user par son id unique
    user = find_by_id(id)
    # On vérifie que le salt enregistré dans le cookie est celui du user
    return nil  if user.nil?
    return user if user.salt == cookie_salt
  end

  private

    # Encryption du password et création du sel si nouvel utilisateur
    def encrypt_password
     # Si nouvel user, on crée son SALT
     self.salt = make_salt if new_record?
     self.password = encrypt(pwd)
    end

    # Renvoie un hash sur base du SALT et d'un string
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end

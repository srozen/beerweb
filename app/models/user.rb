# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  login               :string
#  password            :string
#  salt                :string
#  email               :string
#  firstName           :string
#  lastName            :string
#  birthday            :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  password_reset      :string
#  password_reset_sent :datetime
#

require 'digest'

class User < ActiveRecord::Base

  has_one :collection
  has_one :friendlist

  attr_accessor :pwd

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  login_regex = /\A[a-z0-9_-]{3,15}$\z/i

	validates :login,  :presence => true,
                     :length   => { :maximum => 15 },
                     :format     => { :with => login_regex },
                     :uniqueness => { :case_sensitive => false }


	validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }


	validates :pwd, 	:presence     => true,
							      :confirmation => true,
							      :length       => { :within => 6..40 },
                    :on => [:create]

  validates :visibility,   :presence     => true
  

  # Fonction Callback -> Crypte le mot de passe avant enregistrement du user
  before_save :encrypt_password, if: :no_salt

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

  def self.authenticate_by_mobile(id, encrypted_password)
    user = find_by_id(id)

    return nil if user.nil?
    return user if user.password == encrypted_password

  end

  # Méthode permettant l'envoi du mot de passe reset
  def send_password_reset
    generate_token(:password_reset)
    self.password_reset_sent = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  # Méthode permettant l'envoi de mail de confirmation d'inscription
  def send_welcome
    UserMailer.welcome_mail(self).deliver_now
  end

  # Encryption du password et création du sel si nouvel utilisateur
  def encrypt_password
   # Si nouvel user, on crée son SALT
   self.salt = make_salt if new_record?
   self.password = encrypt(pwd)
  end

  private



    def no_salt
      return self.salt.nil?
    end

    # Renvoie un hash sur base du SALT et d'un string
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{login}")
    end

    def secure_hash(string)
      Digest::SHA512.base64digest(string)
    end
end

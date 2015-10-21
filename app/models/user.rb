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

require 'digest'
class User < ActiveRecord::Base

  # Champ virtuel (mot de passe de travail)
  attr_accessor :pwd

  #attr_accessible :login, :email, :pwd, :pwd_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  name_regex = /\A[a-zA-Z]+\z/

  validates :login, presence: true,
                    length: { minimum: 6 , maximum: 25 }

  validates :email, presence: true,
                    format: { with: email_regex },
                    uniqueness: { case_sensitive: false }

  # Attributs virtuels pour création du mot de passe
  validates :pwd, :presence     => true,
                  :confirmation => true,
                  :length       => { :within => 6..40 }

  # Fonction Callback -> Crypte le mot de passe avant enregistrement du user
  before_save :encrypt_password

  # Retour true (vrai) si le mot de passe correspond.
  def match_password?(submitted_password)
    password == encrypt(submitted_password)
  end

  # Authentification d"un user sur base du login/mot de passe soumis
  def self.authenticate(login, submitted_password)
    # On recherche le user sur base du login
    user = find_by_login(login)
    # On renvoie NIL si inexistant
    return nil  if user.nil?
    # On renvoie le résultat de la comparaison avec le mot de passe
    return user if user.match_password?(submitted_password)
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

    # Création du sel avec le pwd de travail
    def make_salt
      secure_hash("#{Time.now.utc}--#{pwd}")
    end

    def secure_hash(string)
      Digest::SHA512.hexdigest(string)
    end

end

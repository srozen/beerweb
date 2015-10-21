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

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  name_regex = /\A[a-zA-Z]+\z/

  validates :login, presence: true,
                    length: { minimum: 6 , maximum: 25 }

  validates :password, presence: true,
                       length: { within: 6..40 }

  validates :email, presence: true,
                    format: { with: email_regex },
                    uniqueness: { case_sensitive: false }

  validates :firstName, format: { with: name_regex, message: "only allows letters" }

  # Attributs virtuels pour création du mot de passe
  validates :pwd, :presence     => true,
                  :confirmation => true,
                  :length       => { :within => 6..40 }


  before_save :encrypt_password

  def has_password?(wpassword)
    password == wpassword
  end

  private

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

    def encrypt(string)
      secure_hash(string)
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{wpassword_submit}")
    end

    def encrypt_password
      self.salt = make_salt if new_record?
      self.password = encrypt(wpassword_submit)
    end
end

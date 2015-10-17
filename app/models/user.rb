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

class User < ActiveRecord::Base

  validates :login, presence: true,
                    #length: { within: 6..25 }
                    length: { minimum: 6 , maximum: 25 }

  validates :password, presence: true,
                       length: { within: 6..40 }

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
                    format: {with: email_regex},
                    uniqueness: {case_sensitive: false}
end

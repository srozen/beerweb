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

class Contact < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :format     => { :with => email_regex }

  validates :subject, :presence => true,
                      :length => { maximum: 100 }

  validates :content, :presence => true,
                      :length => { maximum: 500 }
end

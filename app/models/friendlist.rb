# == Schema Information
#
# Table name: friendlists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendlist < ActiveRecord::Base
  belongs_to :user
  has_many :friends
end

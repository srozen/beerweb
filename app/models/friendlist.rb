# == Schema Information
#
# Table name: friendlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendlist < ActiveRecord::Base
  belongs_to :user
  has_many :friends
end

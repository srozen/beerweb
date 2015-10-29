# == Schema Information
#
# Table name: friend_statuses
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FriendStatus < ActiveRecord::Base
  has_and_belongs_to_many :friends
end

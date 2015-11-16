# == Schema Information
#
# Table name: friends
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  friendlist_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :friend do
    
  end

end

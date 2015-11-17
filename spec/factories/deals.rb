# == Schema Information
#
# Table name: deals
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  start_date  :string
#  end_date    :string
#  reference   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :deal do
    
  end

end

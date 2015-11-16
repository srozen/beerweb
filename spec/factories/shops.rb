# == Schema Information
#
# Table name: shops
#
#  id                :integer          not null, primary key
#  name              :string
#  contact_detail_id :integer
#  longitude         :float
#  latitude          :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :shop do
    
  end

end

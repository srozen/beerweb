# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  note          :float
#  comment       :text
#  collection_id :integer
#  beer_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :review do
    
  end

end

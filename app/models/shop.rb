# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  name       :string
#  longitude  :float
#  latitude   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shop < ActiveRecord::Base
  has_one :contact_detail, :as => :beer_place
  has_many :deal, :as => :beer_place
end

# == Schema Information
#
# Table name: bars
#
#  id                :integer          not null, primary key
#  name              :string
#  contact_detail_id :integer
#  longitude         :float
#  latitude          :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Bar < ActiveRecord::Base
  has_one :contact_detail, :as => :Beerentity
end

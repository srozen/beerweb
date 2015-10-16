# == Schema Information
#
# Table name: beers
#
#  id          :integer          not null, primary key
#  name        :string
#  degree      :integer
#  description :text
#  story       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Beer < ActiveRecord::Base

  validates :name, :presence => true
  validates :degree, :presence => true

end
